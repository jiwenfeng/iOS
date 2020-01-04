//
//  SRPClient.m
//  DanQu
//
//  Created by 吉文峰 on 2020/1/4.
//  Copyright © 2020 吉文峰. All rights reserved.
//

#import "SRPClient.h"


@implementation SRPClient

// 变量定义
SRP_gN *m_gN = nil;
BIGNUM *m_rd = nil;


+(BIGNUM *)genRandomBytes
{
    unsigned char rand_tmp[32] = {0};
    int sz = sizeof(rand_tmp);
    RAND_bytes(rand_tmp, sz);
    return BN_bin2bn(rand_tmp, sz, NULL);
}

-(BIGNUM *)calcClientKey:(const char *)account password:(const char *)password A:(BIGNUM *)A B:(BIGNUM *)B salt:(BIGNUM *)salt
{
    BIGNUM *u = SRP_Calc_u(A, B, m_gN->N);
    if (NULL == u)
    {
        return NULL;
    }
    BIGNUM *x = SRP_Calc_x(salt, account, password);
    if (NULL == x)
    {
        BN_free(u);
        return NULL;
    }
    BIGNUM *K = SRP_Calc_client_key(m_gN->N, B, m_gN->g, x, m_rd, u);
    BN_free(u);
    BN_free(x);
    return K;
}

-(BIGNUM *)doCalcM1:(const char *)account password:(const char *)password A:(BIGNUM *)A B:(BIGNUM *)B salt:(BIGNUM *)salt key:(BIGNUM *)K
{
    unsigned char *tmp = NULL;
    unsigned char dig[SHA_DIGEST_LENGTH] = {0};
    unsigned char digg[SHA_DIGEST_LENGTH] = {0};
    unsigned char digu[SHA_DIGEST_LENGTH] = {0};
    
    if ((tmp = (unsigned char *)OPENSSL_malloc(BN_num_bytes(m_gN->N))) == NULL)
    {
        return NULL;
    }
    
    EVP_MD_CTX *ctxt = EVP_MD_CTX_new();
    
    EVP_DigestInit_ex(ctxt, EVP_sha1(), NULL);
    BN_bn2bin(m_gN->N, tmp);
    EVP_DigestUpdate(ctxt, tmp, BN_num_bytes(m_gN->N));
    EVP_DigestFinal_ex(ctxt, dig, NULL);
    
    EVP_DigestInit_ex(ctxt, EVP_sha1(), NULL);
    BN_bn2bin(m_gN->g, tmp);
    EVP_DigestUpdate(ctxt, tmp, BN_num_bytes(m_gN->g));
    EVP_DigestFinal_ex(ctxt, digg, NULL);
    
    for(int i = 0; i < SHA_DIGEST_LENGTH; ++i)
    {
        dig[i] ^= digg[i];
    }
    
    EVP_DigestInit_ex(ctxt, EVP_sha1(), NULL);
    EVP_DigestUpdate(ctxt, account, strlen(account));
    EVP_DigestFinal_ex(ctxt, digu, NULL);
    
    EVP_DigestInit_ex(ctxt, EVP_sha1(), NULL);
    EVP_DigestUpdate(ctxt, dig, sizeof(dig));
    EVP_DigestUpdate(ctxt, digu, sizeof(digu));
    BN_bn2bin(salt, tmp);
    EVP_DigestUpdate(ctxt, tmp, BN_num_bytes(salt));
    
    BN_bn2bin(A, tmp);
    EVP_DigestUpdate(ctxt, tmp, BN_num_bytes(A));
    
    BN_bn2bin(B, tmp);
    EVP_DigestUpdate(ctxt, tmp, BN_num_bytes(B));
    
    BN_bn2bin(K, tmp);
    EVP_DigestUpdate(ctxt, tmp, BN_num_bytes(K));
    
    EVP_DigestFinal_ex(ctxt, dig, NULL);
    EVP_MD_CTX_destroy(ctxt);
    OPENSSL_free(tmp);
    
    return BN_bin2bn(dig, sizeof(dig), NULL);
}

// 初始化
-(SRPClient *)init
{
    m_gN = SRP_get_default_gN("2048");
    m_rd = [SRPClient genRandomBytes];
    return self;
}

-(void)dealloc
{
    if (NULL != m_rd)
    {
        BN_free(m_rd);
    }
}

// 生成盐
-(NSString *) genSalt
{
    BIGNUM *rd = [SRPClient genRandomBytes];
    if (NULL == rd)
    {
        return nil;
    }
    char *str = BN_bn2hex(rd);
    BN_free(rd);
    NSString *ret = [[NSString alloc] initWithCString:str encoding:NSASCIIStringEncoding];
    OPENSSL_free(str);
    return ret;
}

-(NSString *) genA
{
    if (nil == m_gN || nil == m_rd)
    {
        return nil;
    }
    BIGNUM *a = SRP_Calc_A(m_rd, m_gN->N, m_gN->g);
    if (NULL == a)
    {
        return nil;
    }
    char *strA = BN_bn2hex(a);
    BN_free(a);
    if (NULL == strA)
    {
        return nil;
    }
    NSString *A = [[NSString alloc] initWithCString:strA encoding:NSASCIIStringEncoding];
    OPENSSL_free(strA);
    return A;
}

-(NSString *) genVerifier:(NSString *)account password:(NSString *)password salt:(NSString *)salt
{
    if (nil == m_gN)
    {
        return nil;
    }
    BIGNUM *s;
    
    if (!BN_hex2bn(&s, [salt cStringUsingEncoding:NSASCIIStringEncoding]))
    {
        return nil;
    }
    
    const char *strAccount = [account cStringUsingEncoding:NSASCIIStringEncoding];
    
    const char *strPassword = [password cStringUsingEncoding:NSASCIIStringEncoding];
    
    BIGNUM *v = NULL;
    if (!SRP_create_verifier_BN(strAccount, strPassword, &s, &v, m_gN->N, m_gN->g))
    {
        BN_free(s);
        return nil;
    }
    char *strVerifier = BN_bn2hex(v);
    BN_free(s);
    BN_free(v);
    if (NULL == strVerifier)
    {
        return nil;
    }
    NSString *verifier = [[NSString alloc] initWithCString:strVerifier encoding:NSASCIIStringEncoding];
    OPENSSL_free(strVerifier);
    return verifier;
}

-(NSString *) calcM1:(NSString *)account password:(NSString *)password NSStrA:(NSString *)NSStrA NSStrB:(NSString *)NSStrB NSStrSalt:(NSString *)NSStrSalt
{
    if (NULL == m_gN || NULL == m_rd)
    {
        return nil;
    }
    const char *strAccount = [account cStringUsingEncoding:NSASCIIStringEncoding];
    const char *strPassword = [password cStringUsingEncoding:NSASCIIStringEncoding];
    const char *strSalt = [NSStrSalt cStringUsingEncoding:NSASCIIStringEncoding];
    const char *strA = [NSStrA cStringUsingEncoding:NSASCIIStringEncoding];
    const char *strB = [NSStrB cStringUsingEncoding:NSASCIIStringEncoding];
    
    BIGNUM *A = NULL;
    BIGNUM *B = NULL;
    BIGNUM *salt = NULL;
    
    if (!BN_hex2bn(&A, strA))
    {
        return nil;
    }
    
    if (!BN_hex2bn(&B, strB))
    {
        BN_free(A);
        return nil;
    }
    
    if (!BN_hex2bn(&salt, strSalt))
    {
        BN_free(A);
        BN_free(B);
        return nil;
    }
    
    BIGNUM *K = [self calcClientKey:strAccount password:strPassword A:A B:B salt:salt];
    
    if (NULL == K)
    {
        BN_free(A);
        BN_free(B);
        BN_free(salt);
        return nil;
    }
    
    BIGNUM *m1 = [self doCalcM1:strAccount password:strPassword A:A B:B salt:salt key:K];
    
    BN_free(A);
    BN_free(B);
    BN_free(salt);
    BN_free(K);
    
    if (NULL == m1)
    {
        return nil;
    }
    
    char *strM1 = BN_bn2hex(m1);
    BN_free(m1);
    if (NULL == strM1)
    {
        return nil;
    }
    
    NSString *ret = [[NSString alloc] initWithCString:strM1 encoding:NSASCIIStringEncoding];
    OPENSSL_free(strM1);
    return ret;
}

@end
