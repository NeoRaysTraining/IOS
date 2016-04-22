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
@end

@implementation ViewController
 
{
    NSString *path;
    
    NSArray *allSongs;
    
    int songPosition;
    
  
}
  


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    songPosition = 0;
    
   
      [self.player setVolume:self.sliderSetValume.value];
    allSongs = [[NSArray alloc]initWithObjects:@"Muskurane (Citylights) Arijit Singh -19",@"Modala Notadalli [KannadaMasti.Net]",@"mysong",@"02 Tu Zaroori - Zid 320kbps ",@"01 Hamari Adhuri Kahani (Title Song) Arijit Singh 320Kbps",@"01 Hamari Adhuri Kahani (Title Song) Arijit Singh 320Kbps",@"03  - Zaroorat- Ek Villain[FreshMaza.Info]",@"03  - Zaroorat- Ek Villain[FreshMaza.Info]",@"06 - Piya Aaye Na [PublicMasti]", nil];
    
    path = [[NSBundle mainBundle]
                      pathForResource:@"Muskurane (Citylights) Arijit Singh -19" ofType:@"mp3"];
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

- (IBAction)Play:(id)sender {
    
    [self.player play];
    //[self.player setVolume:10.0];
}

- (IBAction)Pause:(id)sender {
    [self.player pause];
}

- (IBAction)PlayVideo:(id)sender {
    

    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:
              [NSURL fileURLWithPath:path] error:NULL];
    [self.player stop];
    
   
}

- (IBAction)songBack:(id)sender {
    
    if(songPosition > 0)
    {
    
    songPosition--;
        
    }
    
    
    
    else{
      
       
 // NSUInteger anInt = allSongs.count;
        
      // songPosition = (int)anInt;
        
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
    }
    
    
 
    
    
}

- (IBAction)songForward:(id)sender {
    
    songPosition++;
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:
                   [NSURL fileURLWithPath:path] error:NULL];
    
    
    if(songPosition <= allSongs.count){
        
        NSLog(@"Inside if...");
        
    path = [[NSBundle mainBundle]
            pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
    
    [self.player play];
    }
    
    
    else{
        
        NSLog(@"inside else...");
        songPosition = 0;
        
        path = [[NSBundle mainBundle]
                pathForResource:[allSongs objectAtIndex:songPosition] ofType:@"mp3"];
        
        [self.player play];
        
        
    
    }
}

- (IBAction)sliderVolume:(id)sender {
    
  NSLog(@"Inside slider volume %f",self.sliderSetValume.value);
    

    
    [self.player setVolume:self.sliderSetValume.value];
  
}
@end
