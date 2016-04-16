//
//  ViewController.m
//  CalculatorApp
//
//  Created by test on 16/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{

    NSString *firstValue;
    
    
   char ch;
    
    NSString *secondValue;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)touchButton:(UIButton *)sender {
    
    
    
    
    if(sender.tag<10){
     NSLog(@"First Value befor : %@",firstValue);
        self.labelField.text = [NSString stringWithFormat:@"%ld",(long)sender.tag];
        
        
        if((ch == '+') | '-' | '*' | '/'){
         secondValue = self.labelField.text;
        
        }
        
        else{
         firstValue = self.labelField.text;
        
        }
        
        //  NSLog(@"First Value Sfter : %@",firstValue);
        
         // NSLog(@"Char Value After : %c",ch);
        
    }
    
    else if (sender.tag == 50){
        ch = '*';
        
        NSString *mulChar = @"*";
        self.labelField.text = mulChar;
    }
    
    else if (sender.tag == 60){
        
        ch = '=';
        
        NSString *mulChar = @"=";
        self.labelField.text = mulChar;
        
      
    }
    
    
    else if (sender.tag == 70){
    
        ch = '+';
        
        NSString *plusChar = @"+";
        self.labelField.text = plusChar;
    }
    
    
    else if (sender.tag == 80){
        
        ch = '-';
        NSString *minusChar = @"-";
        self.labelField.text = minusChar;
    }
    
    else if (sender.tag == 90){
        ch = '/';
        
        NSString *minusChar = @"/";
        self.labelField.text = minusChar;
    }
    else if (sender.tag == 100){
       
        ch = 'C';
        self.labelField.text = nil;;
    }
}

-(void)performOperation{
    
    switch (ch) {
        case '+':
          //  self.labelField.text = [NSString stringWithFormat:@"Result : %d",firstValue+secondValue];
            break;
            
        default:
            break;
    }
    
    
    
}


@end


