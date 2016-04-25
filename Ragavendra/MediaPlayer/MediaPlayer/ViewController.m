//
//  ViewController.m
//  MediaPlayer
//
//  Created by test on 4/22/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displaylabel;


@property (weak, nonatomic) IBOutlet UILabel *displayLabelEndPoint;



@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (nonatomic,assign)BOOL      *flag;
@property (nonatomic,strong)NSTimer   *timer;
 
@property (weak, nonatomic) IBOutlet UIButton *playButton;



@property (weak, nonatomic) IBOutlet UIImageView *ImageName;
@property (weak, nonatomic) IBOutlet UILabel *songName;

@property (weak, nonatomic) IBOutlet UISlider *sliderSetVloume;


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
{
    NSString* path;
    NSArray* allSongs;
    NSArray * allImages;
    NSString *imageName;
    int songPosition;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
imageName=[[NSString alloc]init];

self.audioPlayer.delegate=self;
  
    [self.audioPlayer setVolume:25];
    
    
[self.audioPlayer setVolume:self.sliderSetVloume.value];
    
    songPosition=0;

    allSongs=[[NSArray alloc ]initWithObjects:@"MP3 SONG",@"villan",@"RHTDM",@"ghajani",@"sauDard", nil];
    
    allImages=[[NSArray alloc]initWithObjects:@"allu",@"ekVillan",@"rhtdmimg",@"ghajani",@"sauDard",nil];

    
    NSLog(@"All Songs %lu",(unsigned long)allSongs.count);
    
    
path = [[NSBundle mainBundle]
        pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];


    
    
NSError* error=nil;
self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
  
if (error==nil)
{
        
}

}
- (IBAction)PausePlayButton:(id)playButton
{
    
    
    [self.audioPlayer setVolume:self.sliderSetVloume.value];
    
    
    NSLog(@"Inside Play Button");
    [self.timer invalidate];
    
if (!self.ispaused)
{
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"pause"]
        forState:UIControlStateNormal];
    
    
self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
target:self
selector:@selector(updateViews:)
userInfo:nil
                                                                        repeats:YES];
        
[self.audioPlayer play];
        
self.songName.text = [NSString stringWithFormat:@"%@",[allSongs objectAtIndex:songPosition]];
    
        
imageName = [allImages objectAtIndex:songPosition];
self.imageView.image = [UIImage imageNamed:imageName];
        
self.displayLabelEndPoint.text = [self getAudioDuration];
               self.ispaused = YES;
}
else
{
    NSLog(@"Inside Else ");
    
    //player is paused and Button is pressed again
[self.playButton setBackgroundImage:[UIImage imageNamed:@"Play"]
forState:UIControlStateNormal];
                
[self.audioPlayer pause];
            
imageName = [allImages objectAtIndex:songPosition];
                    self.imageView.image = [UIImage imageNamed:imageName];

    
    
    
    
self.ispaused = NO;
            
            

}
}
- (IBAction)VolumeControl:(UISlider*)sender
{
    
self.audioPlayer.volume=sender.value;

}


-(void)startTimer
{
  self.timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateViews:) userInfo:nil repeats:YES];

}
-(void)updateViews:(NSTimer*)timer
{
    
    self.displaylabel.text=[self getCurrentTime];

    self.progressView.progress=[self displayInProgress];
}

-(NSString*)getCurrentTime
{
    int sec=0;
    int mins=0;
    
    int time=(int)self.audioPlayer.currentTime;

    NSLog(@"song  Time is %d",time);
   
    sec=time%60;
    NSLog(@"time in sec%d",sec);
    mins=((int)time/60)%60;
    return [NSString stringWithFormat:@"%d:%d",mins,sec];
}

-(float)displayInProgress
{

if(self.audioPlayer !=nil && self.audioPlayer.duration>0.0)
{

    

return self.audioPlayer.currentTime/self.audioPlayer.duration;
    



}

return 0;


}
-(NSString*)getAudioDuration;
{
    int sec=0;
    int mins=0;
    
    int time=(int)self.audioPlayer.duration;
    sec=time%60;
    mins=((int)time/60)%60;
    return [NSString stringWithFormat:@"%d:%d",mins,sec];

}




- (IBAction)forwardButton:(id)sender
{
    
    songPosition++;
    
        NSLog(@"Song  %d",songPosition);
    
    
    
if(songPosition < allSongs.count)
{
        
        
path = [[NSBundle mainBundle]
pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];

self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:
[NSURL fileURLWithPath:path] error:NULL];
        

        
        
NSLog(@"Song  %d",songPosition);
        
self.songName.text = [NSString stringWithFormat:@"%@",[allSongs objectAtIndex:songPosition]];
        
        
                imageName = [allImages objectAtIndex:songPosition];
                self.imageView.image = [UIImage imageNamed:imageName];
        
        
path = [[NSBundle mainBundle]
pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
        
           //     self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:
//[NSURL fileURLWithPath:path] error:NULL];
        
        
NSLog(@"Songposition befor play ******  %d",songPosition);
                [self.audioPlayer play];
        
        
        
self.displayLabelEndPoint.text = [self getAudioDuration];
        
}
    

else if(songPosition > allSongs.count)
{
        
                NSLog(@"inside else...");
                songPosition = 0;
        
path = [[NSBundle mainBundle]
pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
        
self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:
[NSURL fileURLWithPath:path] error:NULL];
self.displayLabelEndPoint.text = [self getAudioDuration];
        
self.songName.text = [NSString stringWithFormat:@"%@",[allSongs objectAtIndex:songPosition]];
        
        
imageName = [allImages objectAtIndex:songPosition];
self.imageView.image = [UIImage imageNamed:imageName];
        
[self.audioPlayer setVolume:self.sliderSetVloume.value];
[self.audioPlayer play];

}
}

- (IBAction)songBackWordButton:(id)sender

{
    
    [self.audioPlayer setVolume:self.sliderSetVloume.value];
    
       if(songPosition > 0)
           {
            
               songPosition--;
            
               }
    
    
        else{
        
    
        
NSLog(@"The song posintion anint : %d",songPosition);
        
songPosition = 0;
        
}
    
    
    
    
path = [[NSBundle mainBundle]
                             pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
    
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:
                                           [NSURL fileURLWithPath:path] error:NULL];
    
       if(songPosition <= allSongs.count)
            {
                [self.audioPlayer play];
            
    self.displayLabelEndPoint.text = [self getAudioDuration];
            
    [self.audioPlayer setVolume:self.sliderSetVloume.value];
            
            
    self.songName.text = [NSString stringWithFormat:@"%@",[allSongs objectAtIndex:songPosition]];
            
imageName = [allImages objectAtIndex:songPosition];
                    self.imageView.image = [UIImage imageNamed:imageName];
}





}


@end
