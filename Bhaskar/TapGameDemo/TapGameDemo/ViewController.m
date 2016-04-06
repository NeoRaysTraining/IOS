//
//  ViewController.m
//  TapGameDemo
//
//  Created by test on 4/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textInputValue;
@property (strong, nonatomic) IBOutlet UILabel *displayNumberOfTaps;
@property (strong,nonatomic) NSString *taps;
@property (strong,nonatomic) NSNumber *clickTaps;
@property (strong, nonatomic) IBOutlet UILabel *result;
@property (strong,nonatomic) NSNumber *remainingNumberOfClicks,*decValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.taps=self.textInputValue.text;
    //self.displayNumberOfTaps.text=@"Number of clicks requied to win is %@",self.taps;
    self.clickTaps=[NSNumber numberWithInt:0];
    [self.result setHidden:YES];
    [self.performButton setHidden:YES];
    [self.displayNumberOfTaps setHidden:YES];
    self.taps=self.textInputValue.text;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //self.displayNumberOfTaps.text=self.textInputValue.text;
    self.taps=self.textInputValue.text;

    [self.displayNumberOfTaps setHidden:NO];
    [self.performButton setHidden:NO];
    self.decValue=[NSNumber numberWithInt:self.taps.intValue];
    self.displayNumberOfTaps.text=[NSString stringWithFormat:@"Number of taps requied to win is %@",self.taps];
    self.textInputValue.enabled=NO;
    
    
    return YES;
}
- (IBAction)performClick:(id)sender {
    
    int numberOfTapsToClick=self.taps.intValue;
    int value=self.clickTaps.intValue;
    self.clickTaps=[NSNumber numberWithInt:value+1];
    int numberOfTapsToBeClicked=self.clickTaps.intValue;
    if (numberOfTapsToClick==numberOfTapsToBeClicked) {
        [self.displayNumberOfTaps setHidden:YES];
        [self.result setHidden:NO];
        [self.result setText:@"win"];
        
    }
    //int remainingTaps=self.taps.integerValue;
    //int decValue=self.clickTaps.intValue;
    //NSLog(@"%@",self.decValue);
    self.decValue=[NSNumber numberWithInt:self.decValue.intValue-1];
    self.remainingNumberOfClicks=[NSNumber numberWithInt:self.decValue.intValue];
    self.displayNumberOfTaps.text=[NSString stringWithFormat:@"The remaining number of taps %@",self.remainingNumberOfClicks];
    

    
    
    


}
@end
