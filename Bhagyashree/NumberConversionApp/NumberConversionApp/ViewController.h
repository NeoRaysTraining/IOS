//
//  ViewController.h
//  NumberConversionApp
//
//  Created by test on 4/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property int num;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
- (IBAction)convertButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

