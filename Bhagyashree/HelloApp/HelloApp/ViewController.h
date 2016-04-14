//
//  ViewController.h
//  HelloApp
//
//  Created by test on 4/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSString *name;

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)helloButton:(id)sender;

@end

