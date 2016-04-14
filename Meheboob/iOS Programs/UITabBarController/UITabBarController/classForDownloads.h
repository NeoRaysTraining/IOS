//
//  classForDownloads.h
//  UITabBarController
//
//  Created by test on 14/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface classForDownloads : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFoeDownloads;

@property (weak, nonatomic) IBOutlet UILabel *labelForDownloads;
@property(strong, nonatomic)   NSString *laodedImg;
- (IBAction)SecondButton:(id)sender;
- (IBAction)thirdButton:(id)sender;


@end
