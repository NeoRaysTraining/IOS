//
//  ViewController.h
//  CreatingCustomSingletonClass
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)SaveButton:(id)sender;
- (IBAction)LoadButton:(id)sender;

@end

