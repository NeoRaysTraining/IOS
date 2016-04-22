//
//  ViewController.m
//  MediaPlayer
//
//  Created by test on 4/22/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
 


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
NSString *path = [[NSBundle mainBundle]
                      pathForResource:@"ghajani" ofType:@"mp3"];
  
self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)PlayButton:(id)sender {
   
    [self.audioPlayer setVolume:20.0];
    [self.audioPlayer play];

}

- (IBAction)PauseButton:(id)sender {



    [self.audioPlayer pause];
}

- (IBAction)StopButton:(id)sender
{

    [self.audioPlayer stop];
    [self.audioPlayer   setCurrentTime:0.0];
 
}

- (IBAction)backwardButton:(id)sender {


    NSString *path = [[NSBundle mainBundle]
                      pathForResource:@"ghajani" ofType:@"mp3"];
    
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];


}

- (IBAction)forwardButton:(id)sender
{
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:@"ghajani" ofType:@"mp3"];
    
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];

    
    [self forwardButton:@""];

}



@end
