//
//  ViewController.m
//  CalculatorApp
//
//  Created by test on 4/16/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
//#import "RoundButton.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong,nonatomic) NSString *incomingNumber;


@end

@implementation ViewController


@synthesize theNumber,num1,num2,operand,answer;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self setTheNumber:@"0"];
    theNumber=[[NSString alloc]init];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressButton:(UIButton*)sender {
    
    
    if (sender.tag==100||sender.tag==200|| sender.tag==300||sender.tag==400||sender.tag==500) {
        
        
        switch (sender.tag) {
            case 100:
                
                [self saveNum1];
                operand=@"PLUS";
                break;
            case 200:
                [self saveNum1];
                operand=@"MINUS";
                break;
            case 300:
                [self saveNum1];
                operand=@"MULTIPLY";
                break;
            case 400:
                [self saveNum1];
                operand=@"DIVIDE";
                break;
            case 500:
                [self calculateResult:operand];
                break;
            default:
                break;
        }
        
    }
    else
    {
        self.incomingNumber=[NSString stringWithFormat:@"%ld",sender.tag];
    
        self.theNumber=[theNumber stringByAppendingString:self.incomingNumber];
        [self printNumberInLabel];
    }
    
    
}


- (IBAction)clearButton:(id)sender {
    
    [self assignToNil];
}
- (void)calculateResult:(NSString*)sign {
    
    //num2=[theNumber integerValue];
    
    [self saveNum2];
    if([sign isEqualToString:@"PLUS"])
    {
        answer=[num1 intValue]+[num2 intValue];
        self.outputLabel.text=[NSString stringWithFormat:@"%ld",answer];
        
        
        num2=nil;
        theNumber=[NSString stringWithString:self.outputLabel.text];
        
    }
    else if ([sign isEqualToString:@"MINUS"])
    {
        answer=[num1 intValue]-[num2 intValue];
        self.outputLabel.text=[NSString stringWithFormat:@"%ld",answer];
        num2=nil;
        theNumber=[NSString stringWithString:self.outputLabel.text];
    }
    else if ([sign isEqualToString:@"MULTIPLY"])
    {
        answer=[num1 intValue]*[num2 intValue];
        self.outputLabel.text=[NSString stringWithFormat:@"%ld",answer];
        num2=nil;
        theNumber=[NSString stringWithString:self.outputLabel.text];
    }
    else if([sign isEqualToString:@"DIVIDE"])
    {
        if(num2==0)
        {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Caution" message:@"Division by 0 is NOT possible" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil]
            ;
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
        answer=[num1 intValue]/[num2 intValue];
        self.outputLabel.text=[NSString stringWithFormat:@"%ld",answer];
        num2=nil;
        theNumber=[NSString stringWithString:self.outputLabel.text];
    }
    else
    {
        
    }
    
    
}


-(void)printNumberInLabel
{
    self.outputLabel.text=theNumber;
    
}

-(void)saveNum1
{
    
        num1=[NSNumber numberWithInt:theNumber.intValue];
    [self printNumberInLabel];
    self.outputLabel.text=@"0";
    self.theNumber=[[NSString alloc]init];
        //theNumber =@"0";
        //[self printNumberInLabel];
    
        
    
}

-(void)saveNum2
{
    num2=[NSNumber numberWithInt:theNumber.intValue];
    [self printNumberInLabel];
}

-(void)assignToNil
{
    self.outputLabel.text=@"0";
    num1=0;
    num2=0;
    answer=0;
    theNumber=[[NSString alloc]init];
}
@end
