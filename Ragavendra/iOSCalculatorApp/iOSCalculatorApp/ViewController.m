//
//  ViewController.m
//  iOSCalculatorApp
//
//  Created by test on 4/16/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSString *text;

@end

@implementation ViewController
{
NSString *firstValue,*secondValue;
NSMutableString *numberOflabels;

    NSString *text;
char  airthematicOperation;
int firstNums,secondNum;

}
- (void)viewDidLoad
{

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

firstValue= [[NSString alloc]init];
secondValue = [[NSString alloc]init];
numberOflabels=[[NSMutableString alloc]init];


}
-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressButton:(UIButton*)sender

{

NSLog(@"Inside Press Button");
    
    text=self.OutputDisplayLabel.text;
NSLog(@" Given Values :%ld",(long)sender.tag);
    

//self.OutputDisplayLabel.text=[self.text stringByAppendingString:
                           //     @"%lu",(long)sender.tag];
    
    
if (sender.tag<10)
{
self.OutputDisplayLabel.text=[NSString stringWithFormat:@"%lu",(long)sender.tag];
        
    
    
    
    
    
    if (airthematicOperation != '+' && airthematicOperation !='-'&& airthematicOperation!= '*' && airthematicOperation !='/')
{
   
    firstValue=self.OutputDisplayLabel.text;
    NSLog(@"firstValue");
    
}
else
{
        
secondValue= self.OutputDisplayLabel.text;
NSLog(@"secondValue");

}
        
}
if(sender.tag==10)
{

    
airthematicOperation ='+';
NSString *plussign =@"+";
self.OutputDisplayLabel.text=plussign;
    
[self functionality];

}
else if(sender.tag==20)
{
    airthematicOperation ='-';
    NSString *minus =@"-";
    self.OutputDisplayLabel.text=minus;
    [self functionality];
}

else if(sender.tag==30)
{
    airthematicOperation='*';
    NSString *mul =@"*";
    self.OutputDisplayLabel.text=mul;
    NSLog(@"Inside mul****");
    [self functionality];
    
}
else if(sender.tag==40)
{
    airthematicOperation ='/';
    NSString *div =@"/";
    self.OutputDisplayLabel.text=div;

    [self functionality];

}
    

else if(sender.tag == 50)
{

    [self functionality];


}


}
-(void)functionality
{
    NSLog(@"Inside MEthod ");
   
    
    
switch (airthematicOperation)
    {
        
case '+':

    firstNums = [firstValue intValue];
            
    secondNum = [secondValue intValue];
            
    firstNums = firstNums+secondNum;
    secondNum= firstNums+secondNum;

            
    NSLog(@"First nums is : %d",firstNums);
    NSLog(@"second NUm is %d",secondNum);

self.OutputDisplayLabel.text = [NSString stringWithFormat:@"%d",firstNums];
break;
         
    

            

        
case '-':
            
    firstNums = [firstValue intValue];
            
    secondNum = [secondValue intValue];
            
    firstNums = firstNums-secondNum;
    secondNum= firstNums-secondNum;
            
            

            
            
self.OutputDisplayLabel.text=[NSString stringWithFormat:@"%d",firstNums] ;

            
            
break;
            
case '*':
            
firstNums = [firstValue intValue];
            
secondNum = [secondValue intValue];
            
firstNums = firstNums*secondNum;
secondNum= firstNums*secondNum;
            

self.OutputDisplayLabel.text=[NSString stringWithFormat:@"%d",firstNums];
break;

case '/':
            
    firstNums = [firstValue intValue];
            
    secondNum = [secondValue intValue];
            
       
    firstNums = firstNums/secondNum;
    secondNum = firstNums/secondNum;

    NSLog(@"Inside Division");

            
            
            
            
            
self.OutputDisplayLabel.text=[NSString stringWithFormat:@"%d",firstNums] ;
break;
            

    
    
    
    
    
    
    
    
    
    }
}
@end
