//
//  ViewController.h
//  CoreDataDemo
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *age;
@property (strong, nonatomic) IBOutlet UITextField *gender;

- (IBAction)save:(id)sender;

- (IBAction)viewAction:(id)sender;

@end

