//
//  ViewController.m
//  AudioPlayer
//
//  Created by test on 4/22/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()<AVAudioPlayerDelegate>


@property (strong, nonatomic) IBOutlet UIButton *playPause;
@property (strong, nonatomic) IBOutlet UISlider *volumeControl;
@property (strong, nonatomic) IBOutlet UILabel *totalDurationOfTheTrack;
@property (strong, nonatomic) IBOutlet UILabel *nameOfTheTrack;
@property (strong, nonatomic) IBOutlet UIProgressView *progress;
@property (strong, nonatomic) IBOutlet UIImageView *albumImageView;
@property (strong, nonatomic) IBOutlet UILabel *currentDurationDisplyLabel;
@property (assign,nonatomic) int flag,songNumber;
@property (strong,nonatomic) NSTimer *timer;
@property (strong,nonatomic) NSArray *playList,*imageList;
@property (strong,nonatomic)AVAudioPlayer *audio;

//@property (strong,nonatomic) NSString *filePath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.flag=0;
    _songNumber=0;
//    NSLog(@"%f",self.volumeControl.value);
    _playList=[[NSArray alloc]initWithObjects:@"sarrainodu",@"Gudugudiya",@"Guzarish",@"Maaye", nil];
    self.imageList=[NSArray arrayWithObjects:[UIImage imageNamed:@"allu"],[UIImage imageNamed:@"raghu"],[UIImage imageNamed:@"amir"],[UIImage imageNamed:@"jessie"] ,nil];
     NSString *filePath=[[NSBundle mainBundle]pathForResource:[self.playList objectAtIndex:self.songNumber] ofType:@"mp3"];
    _albumImageView.image=[_imageList objectAtIndex:_songNumber];
    
    [self.nameOfTheTrack setText:[_playList objectAtIndex:_songNumber]];
    NSError *error=nil;
    self.audio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:&error];
 
    self.audio.delegate=self;
    if(error==nil)
    {
        [self.audio play];
        
        [self startTimer];
        //self.currentDurationDisplyLabel.text=[self getCurrentTime];
        self.totalDurationOfTheTrack.text=[self totalDurationOfTrack];
    }
    
    
    
}
- (IBAction)Play:(id)sender {
    
    [self playAndPauseAction];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)volumeControlAction:(id)sender {
    
    
    [self.audio setVolume:self.volumeControl.value];
    
}

-(void)startTimer
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
}
- (IBAction)previousSongAction:(id)sender {
    
    if(self.songNumber>0)
    {
        self.songNumber--;
        NSString *filePath=[[NSBundle mainBundle]pathForResource:[self.playList objectAtIndex:self.songNumber] ofType:@"mp3"];
        [self.nameOfTheTrack setText:[self.playList objectAtIndex:self.songNumber]];
        _albumImageView.image=[_imageList objectAtIndex:_songNumber];
        NSError *error=nil;
        self.audio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:&error];
        
        self.audio.delegate=self;
        if(error==nil)
        {
            
        }
        [self.audio play];
        self.totalDurationOfTheTrack.text=[self totalDurationOfTrack];
        self.currentDurationDisplyLabel.text=[self getCurrentTime];

    }
}
- (IBAction)nextSongAction:(id)sender {
    
    //int c=(int)[_playList count];
        self.songNumber++;
        NSString *filePath=[[NSBundle mainBundle]pathForResource:[self.playList objectAtIndex:self.songNumber] ofType:@"mp3"];
    [self.nameOfTheTrack setText:[self.playList objectAtIndex:self.songNumber]];
    _albumImageView.image=[_imageList objectAtIndex:_songNumber];
        NSError *error=nil;
        self.audio=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:&error];
        
        self.audio.delegate=self;
        if(error==nil)
        {
            //_songNumber=0;
        }
        [self.audio play];
    self.totalDurationOfTheTrack.text=[self totalDurationOfTrack];
    self.currentDurationDisplyLabel.text=[self getCurrentTime];
    
//    NSInteger c=[_playList count];
//    if ([self.playList count]==c) {
//        _songNumber=0;
//    }
    

}

-(NSString *)getCurrentTime
{
    int sec=0;
    int min=0;
    
    int currentTime=(int)self.audio.currentTime;
    sec=currentTime%60;
    min=(currentTime/60)%60;
    
    
    return  [NSString stringWithFormat:@"%d: %d",min,sec];
    

}

-(void)updateView{
    self.currentDurationDisplyLabel.text=[self getCurrentTime];
    self.progress.progress=[self displayViewProgress];
    
}

-(float)displayViewProgress
{
    if(self.audio!=nil && self.audio.duration>0.0)
    {
        return self.audio.currentTime/self.audio.duration;
    }
    return 0;
}

-(NSString *)totalDurationOfTrack
{
    int sec=0;
    int min=0;
    
    int currentTime=(int)self.audio.duration;
    sec=currentTime%60;
    min=(currentTime/60)%60;
    
    
    return [NSString stringWithFormat:@"%d: %d",min,sec];
    
}

-(void)playAndPauseAction
{
    if(self.flag==0)
    {
        [self.playPause setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        [self.audio play];
        self.flag=1;
    }
    else
    {
        
        [self.playPause setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [self.audio pause];
        self.flag=0;
    }
    self.totalDurationOfTheTrack.text=[self totalDurationOfTrack];
    
    [self startTimer];
}
@end
