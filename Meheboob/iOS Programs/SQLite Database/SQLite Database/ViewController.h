//
//  ViewController.h
//  SQLite Database
//
//  Created by Mahaboobsab Nadaf on 22/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *regNumberField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *departmentField;

@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *searchStudentField;
- (IBAction)saveButton:(id)sender;
- (IBAction)findButton:(id)sender;

@end

