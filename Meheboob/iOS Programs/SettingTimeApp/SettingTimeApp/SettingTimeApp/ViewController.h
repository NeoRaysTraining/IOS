//
//  ViewController.h
//  SettingTimeApp
//
//  Created by test on 3/31/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeDisplayLabel;
- (IBAction)refreshButton:(id)sender;
@end

