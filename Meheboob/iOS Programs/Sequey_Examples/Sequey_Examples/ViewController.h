//
//  ViewController.h
//  Sequey_Examples
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property(strong,nonatomic)NSString *nameString;
@property(strong,nonatomic) NSString *passwordString;
@end

