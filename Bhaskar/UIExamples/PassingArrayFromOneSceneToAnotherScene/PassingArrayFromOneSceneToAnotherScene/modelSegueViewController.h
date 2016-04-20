//
//  modelSegueViewController.h
//  PassingArrayFromOneSceneToAnotherScene
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface modelSegueViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *done;

@property(strong,nonatomic) NSString *value;

- (IBAction)doneButton:(id)sender;

@end
