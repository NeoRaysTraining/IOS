//
//  ViewController.h
//  ChangingBackgroundColorsWithButtonClick
//
//  Created by test on 3/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *colorNameLabel;
- (IBAction)changeColor:(id)sender;


@end

