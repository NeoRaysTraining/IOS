//
//  AddToDoItemViewController.h
//  ToDoApp
//
//  Created by Mahaboobsab Nadaf on 26/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface AddToDoItemViewController : ViewController
@property (weak, nonatomic) IBOutlet UITextField *setTimeField;
- (IBAction)saveButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *setTimePicker;
- (IBAction)cancelButton:(id)sender;

@end
