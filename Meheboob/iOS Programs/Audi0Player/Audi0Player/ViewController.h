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
- (IBAction)Play:(id)sender;
- (IBAction)Pause:(id)sender;
- (IBAction)PlayVideo:(id)sender;

- (IBAction)songBack:(id)sender;

- (IBAction)songForward:(id)sender;
- (IBAction)sliderVolume:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *sliderSetValume;

@end

