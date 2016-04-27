//
//  ViewController.m
//  AudioPlayerApp
//
//  Created by test on 4/22/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *volumeController;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property AVAudioPlayer *audio ;
@property NSTimer *timer;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   }
- (IBAction)volume:(UISlider*)sender {
    self.audio.volume = sender.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)play:(id)sender {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"audio" ofType:@"mp3"];
    _audio= [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:NULL];
    [_audio play];
    [self startTimer];

}

-(void) startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateViews :) userInfo:nil repeats:YES];
}
-(void) updateViews:(NSTimer*)timer
{
    self.timeLabel.text=[self getCurrentTime];
    self.progressView.progress=self. displayInProgress;
}

-(NSString*)getCurrentTime
{
    int sec=0;
    int mins=0;
    
    int time=(int)self.audio.currentTime;
    sec=time%60;
    mins=((int)time/60)%60;
    return [NSString stringWithFormat:@"%d:%d",mins,sec];
}

-(float) displayInProgress
{
    if (self.audio != nil && self.audio.duration > 0.0){
        
        return self.audio.currentTime / self.audio.duration;
    }
    return 0;
}

- (IBAction)stop:(id)sender {
    self.audio.currentTime=0.0;
    [_audio stop];
}

- (IBAction)pause:(id)sender {
    [_audio pause];
}
@end
