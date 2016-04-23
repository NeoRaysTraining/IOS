//
//  ViewController.h
//  Audi0Player
//
//  Created by test on 22/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
@property(strong, nonatomic)AVAudioPlayer *player;


- (IBAction)songBack:(id)sender;

- (IBAction)songForward:(id)sender;
- (IBAction)sliderVolume:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *sliderSetValume;

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UILabel *duraltion;

@property (weak, nonatomic) IBOutlet UILabel *endDuration;
- (NSString*)getAudioDuration;


@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property BOOL isPaused;

@property (weak, nonatomic) IBOutlet UILabel *songName;



@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@end

