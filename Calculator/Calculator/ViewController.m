//
//  ViewController.m
//  Calculator
//
//  Created by 吉文峰 on 2019/12/23.
//  Copyright © 2019 吉文峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
{
    char op;
}

@synthesize display;
@synthesize omitted_operand;
@synthesize lastop;
@synthesize operand;
@synthesize clear;

-(double) doCalculate:(double)op1:(char)op:(double)op2
{
    switch (op)
    {
        case '+':
            op1 += op2;
            break;
        case '-':
            op1 -= op2;
            break;
        case '*':
            op1 *= op2;
            break;
        case '/':
            op1 /= op2;
            break;
        default:
            break;
    }
    return op1;
}

-(void) onACButtonClick:(UIButton *)button
{
    display.text = @"0";
    [self doInit];
}

-(void) onSignButtonClick:(UIButton *)button
{
    display.text = [[NSString alloc]initWithFormat:@"%g", ([display.text doubleValue] * -1)];
}

-(void) onPercentButtonClick:(UIButton *)button
{
    display.text = [[NSString alloc]initWithFormat:@"%g", [display.text doubleValue] / 100];
}

-(void) onNumberButtonClick:(UIButton *)button
{
    if([display.text isEqualToString:@"0"])
    {
        display.text = button.titleLabel.text;
    }
    else if ([display.text isEqualToString:@"-0"])
    {
        display.text = [[[NSString alloc] initWithString:@"-"] stringByAppendingString:button.titleLabel.text];
    }
    else
    {
        if (clear)
        {
            display.text = button.titleLabel.text;
            clear = FALSE;
        }
        else
        {
            display.text = [[[NSString alloc] initWithString:display.text] stringByAppendingString:button.titleLabel.text];
        }
    }
}

-(void) onOpButtonClick:(UIButton *)button
{
    if(isnan(omitted_operand))
    {
        omitted_operand = [display.text doubleValue];
    }
    else if(isnan(operand))
    {
        operand = [display.text doubleValue];
    }

    if ([button.titleLabel.text isEqualToString:@"="])
    {
        omitted_operand = [self doCalculate:omitted_operand:lastop :operand];
    }
    else
    {
        if(lastop == [button.titleLabel.text characterAtIndex:0])
        {
            omitted_operand = [self doCalculate:omitted_operand :lastop :operand];
        }
        else
        {
            operand = NAN;
        }
        lastop = [button.titleLabel.text characterAtIndex:0];
    }
    display.text = [[NSString alloc] initWithFormat:@"%g", omitted_operand];
    clear = TRUE;
}

-(void) onPointButtonClick:(UIButton *)button
{
    if ([display.text rangeOfString:@"."].location != NSNotFound)
    {
        return;
    }
    display.text = [[[NSString alloc] initWithString:display.text] stringByAppendingString:@"."];
}

-(NSString *)getButtonText:(int)line :(int)column
{
    NSArray *signal = @[
        @[@"AC", @"+/-", @"%", @"/"],
        @[@"7", @"8", @"9", @"*"],
        @[@"4", @"5", @"6", @"-"],
        @[@"1", @"2", @"3", @"+"],
        @[@"0", @".", @"=", @""]
                         ];
    return [[signal objectAtIndex:line] objectAtIndex:column];
}

-(void)createButton:(int)line :(int)column
{
    if(line == 4 && column == 3)
    {
        return;
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    [btn setTitle:[self getButtonText:line:column] forState:UIControlStateNormal];
    if (line == 4 && column == 0)
    {
        btn.frame = CGRectMake(10 + 100 * column , 300 + 100 * line, 180, 90);
    }
    else
    {
        int n = column;
        if (line == 4)
        {
            n += 1;
        }
        btn.frame = CGRectMake(10 + 100 * n , 300 + 100 * line, 90, 90);
    }
    btn.layer.cornerRadius = 45;
    if (line == 0 && column != 3)
    {
        btn.backgroundColor = [UIColor grayColor];
    }
    else
    {
        if (column == 3 || (line == 4 && column == 2))
        {
            btn.backgroundColor = [UIColor orangeColor];
        }
        else
        {
            btn.backgroundColor = [UIColor darkGrayColor];
        }
    }
    
    btn.layer.masksToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:45];
    
    if (line == 0)
    {
        if (column == 0)
        {
            [btn addTarget:self action:@selector(onACButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        if (column == 1)
        {
            [btn addTarget:self action:@selector(onSignButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        if (column == 2)
        {
            [btn addTarget:self action:@selector(onPercentButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        if (column == 3)
        {
            [btn addTarget:self action:@selector(onOpButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
    }
    else if(line == 4)
    {
        if (column == 0)
        {
            [btn addTarget:self action:@selector(onNumberButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        else if (column == 1)
        {
            [btn addTarget:self action:@selector(onPointButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        else if(column == 2)
        {
            [btn addTarget:self action:@selector(onOpButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
    }
    else
    {
        if (column == 3)
        {
            [btn addTarget:self action:@selector(onOpButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
        else
        {
            [btn addTarget:self action:@selector(onNumberButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        }
    }
    [self.view addSubview:btn];
}

-(void) doInit
{
    lastop = '0';
    operand = NAN;
    clear = FALSE;
    omitted_operand = NAN;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doInit];
    int i, j;
    for (i = 0; i < 5; ++i)
    {
        for (j = 0; j < 4; ++j)
        {
            [self createButton:i:j];
        }
    }
    // Do any additional setup after loading the view.
}


@end
