//
//  ViewController.h
//  Calculator
//
//  Created by 吉文峰 on 2019/12/23.
//  Copyright © 2019 吉文峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(void) createButton:(int) line:(int)column;

-(NSString *) getButtonText:(int) line:(int)column;

//
-(void) onACButtonClick:(UIButton *)button;

-(void) onSignButtonClick:(UIButton *)button;

-(void) onPercentButtonClick:(UIButton *)button;

-(void) onOpButtonClick:(UIButton *)button;

-(void) onNumberButtonClick:(UIButton *)button;

-(void) onPointButtonClick:(UIButton *)button;

-(double) doCalculate:(double)op1:(char)op:(double)op2;

-(void) doInit;

@property (strong, nonatomic) IBOutlet UILabel *display;

// 当前输入的数据
@property double omitted_operand;

@property double operand;

@property char lastop;

@property BOOL clear;

@end

