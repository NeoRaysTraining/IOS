//
//  ViewController.m
//  FlipACoinGame
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *inputStr;

@property (nonatomic,assign) int playerExpectedResult,systemGenetratedResult;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.headOrTailImageView setHidden:YES];
    [self.inputText setHidden:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.headOrTailImageView setHidden:NO];
    
    [self.playButton setHidden:NO];
    self.inputText.enabled=NO;
    self.inputStr=self.inputText.text;
    if ([self.inputStr isEqualToString:@"head"]){
        self.playerExpectedResult=0;
        [self.headOrTailImageView setHidden:NO];
        self.headOrTailImageView.image=[UIImage imageNamed:@"head"];
    }
    else
    {
        
        self.playerExpectedResult=1;
        [self.headOrTailImageView setHidden:NO];
        self.headOrTailImageView.image=[UIImage imageNamed:@"tail"];
    }
    
    
    return YES;
}

- (IBAction)playButton:(id)sender {
    
    
    
    if([_playButton.currentTitle isEqualToString:@"PLAY"])
    {
        [self.inputText setHidden:NO];
        [self.playButton setHidden:YES];
        [self.playButton setTitle:@"Flip" forState:UIControlStateNormal];

    }
    else{
        
        
        self.systemGenetratedResult=arc4random_uniform(2);
        
        NSLog(@"%i",self.systemGenetratedResult);
        NSLog(@"%i",self.playerExpectedResult);
        
        self.inputStr=self.inputText.text;
        
        
        if(self.systemGenetratedResult==self.playerExpectedResult)
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Congrajulations" message:@"You Have Won!!!!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Sorry" message:@"please try again" delegate:self cancelButtonTitle:@"play again" otherButtonTitles:@"Cancel", nil];
            [alert show];
        }
    }
}
@end
