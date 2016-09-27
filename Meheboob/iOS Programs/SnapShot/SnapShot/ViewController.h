//
//  ViewController.h
//  SnapShot
//
//  Created by Mahaboobsab Nadaf on 27/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)takeSnapShot:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

