//
//  modelSegueViewController.m
//  PassingArrayFromOneSceneToAnotherScene
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "modelSegueViewController.h"
#import "AppDelegate.h"

@interface modelSegueViewController ()
@property (strong, nonatomic) IBOutlet UITextField *settingValue;


@end

@implementation modelSegueViewController

- (IBAction)doneButton:(id)sender {
    
    _value=self.settingValue.text;
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    
    [app setValueInt:_value];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
}
@end
