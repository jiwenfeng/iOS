//
//  RegisterViewController.m
//  DanQu
//
//  Created by 吉文峰 on 2019/12/30.
//  Copyright © 2019 吉文峰. All rights reserved.
//

#import "RegisterViewController.h"
#import <login.h>
#import "SRPClient.h"
#import "Net.h"

@interface RegisterViewController ()
- (IBAction)onRegisterButtonClick:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtAccount;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtPasswordConfirm;
@property (strong, nonatomic) IBOutlet UIButton *btnRegister;

-(void) onTextChanged;

-(void) goBack;

@end

@implementation RegisterViewController

-(void) onTextChanged
{
    self.btnRegister.enabled = self.txtAccount.text.length > 0 && self.txtPassword.text.length > 0 && self.txtPasswordConfirm.text.length > 0;
}

- (IBAction)onRegisterButtonClick:(UIButton *)sender {
    @try {
        
        SRPClient *srp = [[SRPClient alloc] init];
        
        LoginRegReqData *req = [[LoginRegReqData alloc] init];
        req.strAccount = self.txtAccount.text;
        req.strPhone = @"12345678901";
        req.strDevice = @"123123";
        req.strSalt = [srp genSalt];
        req.strVerifier = [srp genVerifier:self.txtAccount.text password:self.txtPassword.text salt:req.strSalt];
        
        ICEContext *ctx = [[ICEContext alloc] init];
        [[Net getInstance] call:@"Register" req:req context:ctx response:^(BOOL flag, NSMutableData * inEncaps) {
            //
            LoginRegRspData *rsp = [[LoginRegRspData alloc] init];
            
            [[Net getInstance] Unpack:inEncaps value:rsp];
            
            NSLog(@"注册返回:ret=%d", rsp.ret);
        }];
        
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    } @finally {
        
    }
}

-(void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
    
    self.navigationItem.leftBarButtonItem = item;
    
    [self.txtAccount addTarget:self action:@selector(onTextChanged) forControlEvents:UIControlEventEditingChanged];
    [self.txtPassword addTarget:self action:@selector(onTextChanged) forControlEvents:UIControlEventEditingChanged];
     [self.txtPasswordConfirm addTarget:self action:@selector(onTextChanged) forControlEvents:UIControlEventEditingChanged];
}

@end
