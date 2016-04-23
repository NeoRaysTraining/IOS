//
//  ViewController.m
//  Audi0Player
//
//  Created by test on 22/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (assign,nonatomic) float count;

@property(nonatomic,assign)BOOL flag;
@property(nonatomic,strong) NSTimer *timer;







@end

@implementation ViewController
 
{
    
  
    NSString *path;
    
    NSArray *allSongs;
    
    NSArray *allImages;
    
    NSString *imageName;
    
    int songPosition;
    
  
}
  


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    imageName = [[NSString alloc]init];
    
    
    self.player.delegate = self;
   
    songPosition = 0;
    
   
      [self.player setVolume:self.sliderSetValume.value];
    
    
    allSongs = [[NSArray alloc]initWithObjects:@"Muskurane (Citylights) Arijit Singh -19",@"Modala Notadalli [KannadaMasti.Net]",@"mysong",@"02 Tu Zaroori - Zid 320kbps ",@"01 Hamari Adhuri Kahani (Title Song) Arijit Singh 320Kbps",@"03  - Zaroorat- Ek Villain[FreshMaza.Info]",@"03  - Zaroorat- Ek Villain[FreshMaza.Info]",@"06 - Piya Aaye Na [PublicMasti]", nil];
    
    allImages = [[NSArray alloc]initWithObjects:@"mus",@"modal",@"mysong",@"tu zaruri",@"HamariAdhuri",@"Ek vilan",@"Ek vilan",@"Ashiki",nil];
    
    path = [[NSBundle mainBundle]
                     pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
    NSError *error=nil;
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:
                   [NSURL fileURLWithPath:path] error:&error];
    if(error==nil)
    {
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (IBAction)songBack:(id)sender {
    
     [self.player setVolume:self.sliderSetValume.value];
    
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
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:
                   [NSURL fileURLWithPath:path] error:NULL];
    
    if(songPosition <= allSongs.count)
    {
    [self.player play];
        
          self.endDuration.text = [self getAudioDuration];
        
         [self.player setVolume:self.sliderSetValume.value];
        
        
           self.songName.text = [NSString stringWithFormat:@"%@",[allSongs objectAtIndex:songPosition]];
        
        
        
        imageName = [allImages objectAtIndex:songPosition];
        self.imageView.image = [UIImage imageNamed:imageName];
    
 
    
    }
}

- (IBAction)songForward:(id)sender {
    
    
    
    songPosition++;
    
    NSLog(@"Songposition starting -----  %d",songPosition);
 
    

    
    
    
   
    
    
    if(songPosition < allSongs.count){
        
        
        path = [[NSBundle mainBundle]
                pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
        
        self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:
                       [NSURL fileURLWithPath:path] error:NULL];
        
        NSLog(@"Inside if... allsongs count");
        
        
        NSLog(@"Songposition befor bext ++++  %d",songPosition);
        
         self.songName.text = [NSString stringWithFormat:@"%@",[allSongs objectAtIndex:songPosition]];
        
        
        imageName = [allImages objectAtIndex:songPosition];
        self.imageView.image = [UIImage imageNamed:imageName];

    
        path = [[NSBundle mainBundle]
                pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
        
        self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:
                       [NSURL fileURLWithPath:path] error:NULL];
   
        
        NSLog(@"Songposition befor play ******  %d",songPosition);
        [self.player play];
        
        
        
          self.endDuration.text = [self getAudioDuration];
        
        
    }
    
    
    else  if(songPosition > allSongs.count){
        
        NSLog(@"inside else...");
        songPosition = 0;
        


        
        path = [[NSBundle mainBundle]
                pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
        
        self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:
                       [NSURL fileURLWithPath:path] error:NULL];
       
        
          self.endDuration.text = [self getAudioDuration];
        
           self.songName.text = [NSString stringWithFormat:@"%@",[allSongs objectAtIndex:songPosition]];
        
        
        imageName = [allImages objectAtIndex:songPosition];
        self.imageView.image = [UIImage imageNamed:imageName];
        
         [self.player setVolume:self.sliderSetValume.value];
        
     [self.player play];
    }
}

- (IBAction)sliderVolume:(id)sender {
    
  
    

    
    [self.player setVolume:self.sliderSetValume.value];
  
}

-(void)startTheTimer{

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTheViews :) userInfo:nil repeats:YES];

}
-(void)updateTheViews : (NSTimer *)timer{

    self.duraltion.text = [self getTheCurrentTime];
    
    self.progressView.progress = [self displayTheProgressOfSong];
    
    

}

-(NSString*)getTheCurrentTime{
    int sec=0;
    int mins=0;
    
    int time=(int)self.player.currentTime;
    sec=time%60;
    mins=((int)time/60)%60;
    return [NSString stringWithFormat:@"%d:%d",mins,sec];

}

-(float)displayTheProgressOfSong{

    if (self.player != nil && self.player.duration > 0.0){
        
       
        
        return self.player.currentTime / self.player.duration;
        
}
    return 0.0;
}

- (NSString*)getAudioDuration {
    int sec=0;
    int mins=0;
    
    int time=(int)self.player.duration;
    sec=time%60;
    mins=((int)time/60)%60;
    return [NSString stringWithFormat:@"%d:%d",mins,sec];
}

















- (IBAction)playAudioPressed:(id)playButton
{
    [self.timer invalidate];
    //play audio for the first time or if pause was pressed
    if (!self.isPaused) {
        [self.playButton setBackgroundImage:[UIImage imageNamed:@"play"]
                                   forState:UIControlStateNormal];
        
        //start a timer to update the time label display
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(updateTheViews:)
                                                    userInfo:nil
                                                     repeats:YES];
        
        [self.player play];
        
        self.songName.text = [NSString stringWithFormat:@"%@",[allSongs objectAtIndex:songPosition]];
        
        
        imageName = [allImages objectAtIndex:songPosition];
        self.imageView.image = [UIImage imageNamed:imageName];
        
        self.endDuration.text = [self getAudioDuration];
        self.isPaused = TRUE;
        
     
        
    } else {
        //player is paused and Button is pressed again
        [self.playButton setBackgroundImage:[UIImage imageNamed:@"pause"]
                                   forState:UIControlStateNormal];
        
        [self.player pause];
        
        
        imageName = [allImages objectAtIndex:songPosition];
        self.imageView.image = [UIImage imageNamed:imageName];
        self.isPaused = FALSE;
        
  
    }
}


@end
