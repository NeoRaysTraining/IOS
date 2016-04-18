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
    
    int firstInt;
    
    int secondInt;
    
    int flag;
    
    
    
    NSMutableString *numbersFromLabels;
    
 
  

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // self.labelField.text = @"0";
    
    numbersFromLabels = [[NSMutableString alloc]init];
    
    NSLog(@"Value of first int is : %i",firstInt);
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)touchButton:(UIButton *)sender {
    

    
    
    
    if(sender.tag<10){
        
        
     NSLog(@"First Value befor : %@",firstValue);
        
            numbersFromLabels = [NSMutableString stringWithFormat:@"%ld",(long)sender.tag];
        
        
        _labelField.text = [_labelField.text stringByAppendingString:numbersFromLabels];
        
    
        
        switch (ch) {
            case '+': case '-': case '*': case '/':
                secondValue = self.labelField.text;
                
              
                
                
                secondValue = [secondValue substringFromIndex:1];
             
                            secondInt = [secondValue intValue];

                break;
                
            default:
                
                firstValue = self.labelField.text;
                
                
                            firstInt = [firstValue intValue];
                break;
        }
        

        
    }
    
    
    
    
    
    
    
    
    if (sender.tag == 50){
        
        
        [self performOperation];
        self.labelField.text = [NSString stringWithFormat:@"%d",firstInt];
       
        ch = '*';
        
        NSString *mulChar = @"*";
        self.labelField.text = mulChar;
        
      
    }
    
    
    else if (sender.tag == 60){
        
        if(secondInt == 0 && ch == '/')
        {
            self.labelField.text = @"Cannot devide by zero";
           
        }
        
        else {
        
        [self performOperation];
            
            secondInt = 0;
            
            
        }
    }
    
    
    else if (sender.tag == 70){
        
        [self performOperation];

    
        ch = '+';
        
        NSString *plusChar = @"+";
        self.labelField.text = plusChar;
    }
    
    
    
    
    else if (sender.tag == 80){
        
        [self performOperation];

        
        ch = '-';
        NSString *minusChar = @"-";
        self.labelField.text = minusChar;
    }
    
    else if (sender.tag == 90){
        
        [self performOperation];

        ch = '/';
        
        NSString *minusChar = @"/";
        self.labelField.text = minusChar;
    }
    else if (sender.tag == 100){
       
        ch = 'C';
        self.labelField.text = @"";
        
        firstInt = 0;
    }
    
    
    
    
}






-(void)performOperation {
    
    switch (ch) {
        case '+':
            self.labelField.text = [NSString stringWithFormat:@" %d",firstInt+secondInt];
            
            firstInt = firstInt+secondInt ;
            break;
            
            
        case '-':
            self.labelField.text = [NSString stringWithFormat:@" %d",firstInt-secondInt];
              firstInt = firstInt-secondInt ;
            break;
            
        case '/':
            self.labelField.text = [NSString stringWithFormat:@" %d",firstInt/secondInt];
              firstInt = firstInt/secondInt ;
            break;
            
        case '*':
            self.labelField.text = [NSString stringWithFormat:@" %d",firstInt*secondInt];
              firstInt = firstInt*secondInt ;
            break;
            
        default:
            break;
    }
    
    
    
}


@end


