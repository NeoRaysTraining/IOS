//
//  ViewController.h
//  MediaPlayer
//
//  Created by test on 4/22/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
@property(strong, nonatomic) AVAudioPlayer * audioPlayer;

@end

