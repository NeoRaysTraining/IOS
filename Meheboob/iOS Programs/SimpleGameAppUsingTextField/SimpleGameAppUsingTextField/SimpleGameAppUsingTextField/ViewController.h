//
//  ViewController.h
//  SimpleGameAppUsingTextField
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelFieldTop;
@property (weak, nonatomic) IBOutlet UILabel *labelFieldBottom;

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserValue;

- (IBAction)clickMeButton:(id)sender;


@end

