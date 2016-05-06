//
//  ViewController.h
//  CoreData
//
//  Created by test on 06/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *ageField;

@property (weak, nonatomic) IBOutlet UITextField *genderField;

- (IBAction)saveButton:(id)sender;


- (IBAction)viewData:(id)sender;

@end

