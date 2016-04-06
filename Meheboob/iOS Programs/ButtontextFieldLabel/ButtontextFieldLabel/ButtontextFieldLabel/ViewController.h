//
//  ViewController.h
//  ButtontextFieldLabel
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelField;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)clickButton:(id)sender;


@end

