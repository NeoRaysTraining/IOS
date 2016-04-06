//
//  ViewController.m
//  SimpleGameAppUsingTextField
//
//  Created by Meheboob on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_textFieldUserValue setPlaceholder:@"Enter a number to tap button"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
int countButtonClick;
- (IBAction)clickMeButton:(id)sender {
    countButtonClick++;
    
startAgain: NSLog(@"Inside the touch button");
    [_labelFieldTop setBackgroundColor:[UIColor grayColor]];
    
    NSString *textValue = [_textFieldUserValue text];
    
    int textToInt = [textValue intValue];
    
    //Creating string object by using text typed in text field
    NSString *message = [[NSString alloc]initWithFormat:@"You have to tap for %i times",textToInt-1];
    
    
    NSLog(@"the text val is %@",textValue);
    
    
    
    //Assigning the text to the label by using message Object
    [ _labelFieldTop setText:message];
    
    //Textfield is removed after clicking submit button
    [_textFieldUserValue resignFirstResponder];
    
    NSLog(@"Button is clicked for %i times",countButtonClick);
    
    if(countButtonClick >1)
    {
        //_textFieldUserValue.enabled = NO;
        
        _textFieldUserValue.hidden  = YES;
       [ _labelFieldTop setText:nil];
        [_labelFieldTop setBackgroundColor:[UIColor colorWithRed:36 green:226 blue:48 alpha:0]];
    }
    
    if(countButtonClick == textToInt )
    {
        _labelFieldBottom.hidden = NO;
        NSLog(@"Inside bottom button");
        NSString *wonMessage =@"You Won";
        [_labelFieldBottom setTextColor:[UIColor redColor]];
        
        [_labelFieldBottom setBackgroundColor:[UIColor grayColor]];
        [_labelFieldBottom setText:wonMessage];
        
    
    }
    
    if(countButtonClick >textToInt)
    {
        countButtonClick = 1;
        _textFieldUserValue.hidden  = NO;
        
        _labelFieldBottom.hidden = YES;
        goto startAgain;
    }
}
@end
