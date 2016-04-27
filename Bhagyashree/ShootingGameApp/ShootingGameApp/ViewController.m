//
//  ViewController.m
//  ShootingGameApp
//
//  Created by test on 4/21/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *player2Label;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property NSInteger score1;
@property NSInteger score2;
@property (weak, nonatomic) IBOutlet UIView *player1View;
@property (weak, nonatomic) IBOutlet UIView *player2View;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.player1View.hidden=YES;
    self.player2View.hidden=YES;
    self.label.hidden=YES;
    self.player2Label.hidden=YES;

    }
- (IBAction)play1:(id)sender {
    _score1=0;
    self.player1View.hidden=NO;
    self.label.hidden=NO;
    self.label.text=@"Player 1";
    }
- (IBAction)play2:(id)sender {
    _score2=0;
    self.player2View.hidden=NO;
    self.player2Label.hidden=NO;
    self.player2Label.text=@"Player 2";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)player1Tap:(id)sender {
    
    _score1=_score1+10;
    if(_score1==100)
    {
    self.label.text=@"WINNER";
    }
    NSLog(@"score1 tap: %ld",(long)_score1);
}
- (IBAction)player2Tap:(id)sender {
    _score2=_score2+10;
    if(_score2==100)
    {
        self.player2Label.text=@"WINNER";
    }
        NSLog(@"score2 tap: %ld",(long)_score2);
}
- (IBAction)player1SwipeR:(id)sender {
    _score1=_score1+20;
    if(_score1==100)
    {
        self.label.text=@"WINNER";
    }
        NSLog(@"score1 SR: %ld",(long)_score1);
}
- (IBAction)player1SwipeL:(id)sender {
    _score1=_score1+20;
    if(_score1==100)
    {
        self.label.text=@"WINNER";
    }
        NSLog(@"score1 SL: %ld",(long)_score1);
}
- (IBAction)player2SwipeR:(id)sender {
    _score2=_score2+20;
    if(_score2==100)
    {
        self.player2Label.text=@"WINNER";
    }
        NSLog(@"score2 SR: %ld",(long)_score2);
}
- (IBAction)player2SwipeL:(id)sender {
    _score2=_score2+20;
    if(_score2==100)
    {
        self.player2Label.text=@"WINNER";
    }
        NSLog(@"score2 SL: %ld",(long)_score2);
}

@end
