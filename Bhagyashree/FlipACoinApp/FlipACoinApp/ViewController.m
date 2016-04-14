//
//  ViewController.m
//  FlipACoinApp
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *optionTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property NSString *flip;
@property NSString *resValue;
@property int number;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"head"];
    [self.playButton setHidden:YES];
    [self.resultLabel setHidden:YES];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.imageView setImage:[UIImage imageNamed:@"flip"]];
    [self.playButton setHidden:NO];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static int flag=0;
- (IBAction)playButton:(id)sender {
    flag=1;
    self.number = arc4random_uniform(2);
    [self.resultLabel setHidden:NO];
    
    if(_number==0)
    {
        self.resValue = @"head";
    }
    else
    {
        self.resValue = @"tail";
    }
    self.flip= self.optionTextField.text;
    NSLog(@"%@",_resValue);
    NSLog(@"%@",_flip);
    self.imageView.image = [UIImage imageNamed:_resValue];
    
    if([self.resValue isEqualToString:self.flip])
        {
            self.resultLabel.text = @"YOU WON";
            flag=0;
        }
        else
        {
            self.resultLabel.text = @"YOU LOST";
            flag=0;
        }
    }

@end
