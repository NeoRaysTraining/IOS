//
//  ViewController.m
//  AudioAppWithImages
//
//  Created by test on 4/23/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property AVAudioPlayer *audio;
@property (weak, nonatomic) IBOutlet UIButton *playPause;
@property (weak, nonatomic) IBOutlet UISlider *volumeController;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property NSTimer *timer;
@property (nonatomic,strong) NSArray *songs;
@property (weak, nonatomic) IBOutlet UIButton *forward;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *moveLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _songs=@[@"galiya",@"muskurane",@"chittiya",@"sooraj",@"audio"];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.volumeController.hidden=YES;
    
    self.audio.volume = 15.0;
}
static int flag=0;
- (IBAction)volButton:(id)sender {
    flag++;
    if(flag==1)
    {
    self.volumeController.hidden=NO;
        flag=0;
    }
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



- (IBAction)volSlider:(UISlider*)sender {
    self.audio.volume = sender.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
static int play=0;
- (IBAction)playPause:(id)sender {
    if(play==0)
    {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:_songs[songsCount] ofType:@"mp3"];
    _audio= [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:NULL];
    [_audio play];
    [self startTimer];
        //self.playPause.imageView.image=[UIImage imageNamed:@"pause"];
        UIImage *img = [UIImage imageNamed:@"pause"];
        [self.playPause setImage:img forState:UIControlStateNormal];
        self.imageView.image = [UIImage imageNamed:_songs[songsCount]];
        self.moveLabel.text=_songs[songsCount];
    
        [UIView animateWithDuration:0.5 animations:^{
        _moveLabel.transform = CGAffineTransformMakeScale(1.3,1.3);
        } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
        _moveLabel.transform = CGAffineTransformIdentity;
            }];
        }];
        
        
        play=1;
    }
    else if (play==1)
    {
        UIImage *img = [UIImage imageNamed:@"play"];
        [self.playPause setImage:img forState:UIControlStateNormal];
            [_audio pause];
            play=0;
    }
}

static int songsCount=0;
- (IBAction)forward:(id)sender {
    songsCount++;
    if(songsCount<[_songs count])
    {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:_songs[songsCount] ofType:@"mp3"];
        _audio= [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:NULL];
        [_audio pause];
        self.imageView.image = [UIImage imageNamed:_songs[songsCount]];
        self.moveLabel.text=_songs[songsCount];


    }
    else if(songsCount>=[_songs count])
    {
        songsCount=0;
        NSString *filePath = [[NSBundle mainBundle]pathForResource:_songs[songsCount] ofType:@"mp3"];
        _audio= [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:NULL];
        [_audio play];
        self.imageView.image = [UIImage imageNamed:_songs[songsCount]];
        self.moveLabel.text=_songs[songsCount];


    }
}
- (IBAction)backward:(id)sender {
    songsCount--;
    if(songsCount<[_songs count])
    {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:_songs[songsCount] ofType:@"mp3"];
        _audio= [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:NULL];
        [_audio play];
        self.imageView.image = [UIImage imageNamed:_songs[songsCount]];
        self.moveLabel.text=_songs[songsCount];


    }
    else if(songsCount>=[_songs count])
    {
        songsCount=0;
        NSString *filePath = [[NSBundle mainBundle]pathForResource:_songs[songsCount] ofType:@"mp3"];
        _audio= [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:NULL];
        [_audio play];
        self.imageView.image = [UIImage imageNamed:_songs[songsCount]];
        self.moveLabel.text=_songs[songsCount];


    }
}

@end
