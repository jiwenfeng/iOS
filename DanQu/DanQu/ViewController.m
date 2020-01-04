//
//  ViewController.m
//  DanQu
//
//  Created by 吉文峰 on 2019/12/30.
//  Copyright © 2019 吉文峰. All rights reserved.
//

#import "ViewController.h"
#import "SRPClient.h"
#import <login.h>
#import "Net.h"


@interface ViewController ()

- (IBAction)onLoginButtonClick:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet UITextField *txtAccount;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UILabel *txtLoginResult;

-(void) onTextChange;

@end

@implementation ViewController

@synthesize txtAccount;
@synthesize loginBtn;
@synthesize txtPassword;
@synthesize txtLoginResult;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.txtAccount addTarget:self action:@selector(onTextChange) forControlEvents:UIControlEventEditingChanged];
    [self.txtPassword addTarget:self action:@selector(onTextChange) forControlEvents:UIControlEventEditingChanged];
  
    
}

-(void) doLoginVerify:(NSString *)account password:(NSString *)password srp:(SRPClient *)srp A:(NSString *)A B:(NSString *)B salt:(NSString *)salt
{
    @try {
        
        LoginLoginVerifyReqData *req = [[LoginLoginVerifyReqData alloc] init];
        req.strAccount = account;
        req.strM1 = [srp calcM1:account password:password NSStrA:A NSStrB:B NSStrSalt:salt];
        
        ICEContext *ctx = [[ICEContext alloc] init];
        [[Net getInstance] call:@"LoginVerify" req:req context:ctx response:^(BOOL flag, NSMutableData * inEncaps) {
            LoginLoginRspData *rsp = [[LoginLoginRspData alloc] init];
            [[Net getInstance] Unpack:inEncaps value:rsp];
            
            if (rsp.ret == LoginSuccess)
            {
                NSLog(@"%@登录成功", account);
               // _txtLoginResult.text = @"登录成功";
            }
            else
            {
                NSLog(@"%@登录失败:%d", password, rsp.ret);
               // _txtLoginResult.text = @"登录失败";

            }
        }];
        
        
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    } @finally {
        
    }
}

-(void)onTextChange
{
    self.loginBtn.enabled = (self.txtAccount.text.length > 0 && self.txtPassword.text.length > 0);
}

- (IBAction)onLoginButtonClick:(UIButton *)sender {
    
    @try {
        
        SRPClient *srp = [[SRPClient alloc] init];
        LoginGetVerifyInfoReqData *req = [[LoginGetVerifyInfoReqData alloc]init];
        req.strA = [srp genA];
        req.strAccount = self.txtAccount.text;
        req.strDevice = @"123123";
        
        ICEContext *ctx = [[ICEContext alloc] init];
        NSString *account = self.txtAccount.text;
        NSString *passwd = self.txtPassword.text;
        NSLog(@"account:%@\n passwd:%@", account, passwd);
        [[Net getInstance] call:@"GetVerifyInfo" req:req context:ctx response:^(BOOL flag, NSMutableData *inEncaps) {
            LoginGetVerifyInfoRspData *rsp = [[LoginGetVerifyInfoRspData alloc] init];
            [[Net getInstance] Unpack:inEncaps value:rsp];
            
            if (rsp.ret != LoginSuccess)
            {
                NSLog(@"GetVerifyInfo return:%d", rsp.ret);
                return;
            }
            [self doLoginVerify:account password:passwd srp:srp A:req.strA B:rsp.strB salt:rsp.strSalt];
        }];
        
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    } @finally {
        
    }
}
@end
