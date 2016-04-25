//
//  ViewController.m
//  AudioPlayer
//
//  Created by test on 4/22/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVAudioPlayerDelegate,AVAudioRecorderDelegate>


@property (weak, nonatomic) IBOutlet UISlider *sliderCount;
@property(strong,nonatomic)AVAudioPlayer *player;
@property (weak, nonatomic) IBOutlet UILabel *toatalDuration;

@property(strong,nonatomic)AVAudioRecorder *recorder;

@property(assign,nonatomic)int count;

@property(strong,nonatomic) NSMutableArray* songList;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageOutlet;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;

@property(strong,nonatomic)NSTimer* timeCount;

@property (weak, nonatomic) IBOutlet UIButton *playOrPauseImage;

@property (assign,nonatomic)BOOL playAndPause;

@property (strong,nonatomic) NSArray* imageList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.count = 0;
    self.playAndPause = true;
    
    self.imageList = [[NSArray alloc]initWithObjects:@"ekvillan",@"jubtak",@"kahani2",@"zid",@"badlpur",@"kahani",@"ekvillan",nil];
    
    self.songList = [[NSMutableArray alloc]initWithObjects:@"03  - Zaroorat- Ek Villain[FreshMaza.Info]",@"02---Saans-[FreshMaza.Com]",@"02 Tu Zaroori - Zid 320kbps ",@"02 Jeena Jeena - Badlapur. 320 kbps",@"01 Hamari Adhuri Kahani (Title Song) Arijit Singh 320Kbps",@"01 - Sooraj Dooba Hain - DownloadMing.SE",@"01 - Galliyan (Ek Villain) - 190Kbps  FreshMaza.Info ", nil];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"02---Saans-[FreshMaza.Com]" ofType:@"mp3"];
    
    self.songNameLabel.text = [NSString stringWithFormat:@"02---Saans-[FreshMaza.Com]"];
    self.imageOutlet.image = [UIImage imageNamed:@"ekvillan"];
    
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:&error];

    
    
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)play:(id)sender
{
    
    
    if(self.playAndPause == true)
    {
               self.player.delegate = self;
        self.toatalDuration.text = [self totalDuration];
        [self startTimer];

        UIImage *buttonImage = [UIImage imageNamed:@"play"];
        [self.playOrPauseImage setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [self.view addSubview:self.playOrPauseImage];
        [self.player play];
        self.toatalDuration.text = [self totalDuration];
        [self startTimer];
        [self.player delegate];
        [self.player play];
        self.playAndPause = false;
    }
    else if (self.playAndPause == false)
    {
        UIImage *buttonImage = [UIImage imageNamed:@"pause"];
        [self.playOrPauseImage setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [self.view addSubview:self.playOrPauseImage];
        [self.player pause];
        
        self.playAndPause = true;
    }

}
- (IBAction)sliderButton:(id)sender
{
    [self.player setVolume:self.sliderCount.value];
   
}
- (IBAction)forward:(id)sender
{
    NSLog(@"%d",self.count);
    
    
    
   if(self.count==6)
   {
       self.count = 0;
   
   }
    
    self.count++;
    NSString *songName=[self.songList objectAtIndex:self.count];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:songName ofType:@"mp3"];
    
   
    self.songNameLabel.text = [NSString stringWithFormat:@"%@",[self.songList objectAtIndex:self.count]];
    
    self.imageOutlet.image = [UIImage imageNamed:[self.imageList objectAtIndex:self.count]];
    NSError *error = nil;
    
   self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:&error];
    self.player.delegate = self;
        [self.player play];
    
        self.toatalDuration.text = [self totalDuration];
        [self startTimer];
    if(_count == 7)
    {
        self.count = 0;
    }
}

- (IBAction)backward:(id)sender
{
    self.count--;
    int i = 0;
    
    if(i == self.count)
    {
        self.count++;
    }
   NSString *songName=[self.songList objectAtIndex:self.count];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:songName ofType:@"mp3"];
    
    NSLog(@"%@",[self.songList objectAtIndex:self.count]);
    self.songNameLabel.text = [NSString stringWithFormat:@"%@",[self.songList objectAtIndex:self.count]];
    NSError *error = nil;
   self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:&error];
    self.player.delegate = self;
    
    [self.player play];
    

}
-(void)startTimer
{
    self.timeCount = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self selector:@selector(updateViews:) userInfo:nil repeats:YES];
                      
}
-(void)updateViews:(NSTimer*)timer{
    
    self.timerLabel.text=[self getCurrentTime];
    self.progressView.progress=[self displayInProgress];
}
-(NSString*)getCurrentTime{
    
    
    
    int sec=0;
    int mins=0;
    //int sec2 =0;
    //int min2 = 0;
    //int durationTime = (int)self.player.duration;
    int time=(int)self.player.currentTime;
    sec=time%60;
    mins=((int)time/60)%60;
    return [NSString stringWithFormat:@"%d:%d",mins,sec];
    //  self.progressView.progress=
}

-(float)displayInProgress{
    
    if (self.player != nil && self.player.duration > 0.0){
        
        //NSLog(@"dur:%f",self.audioPlayer.currentTime / self.audioPlayer.duration);
        
        return self.player.currentTime / self.player.duration;
        
    }
    
    return 0;
}
-(NSString*)totalDuration
{
    int sec=0;
    int mins=0;
    //int sec2 =0;
    //int min2 = 0;
    //int durationTime = (int)self.player.duration;
    int time=(int)self.player.duration;
    sec=time%60;
    mins=((int)time/60)%60;
    return [NSString stringWithFormat:@"%d:%d",mins,sec];

}


@end
