//
//  ViewController.m
//  SQLite Database
//
//  Created by Mahaboobsab Nadaf on 22/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
    
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (self.regNumberField.text.length>0 &&self.nameField.text.length>0 && self.departmentField.text.length>0 &&self.yearField.text.length>0 ) {
        success = [[DBManager getSharedInstance] saveData:self.regNumberField.text name:self.nameField.text department:self.departmentField.text year:self.yearField.text];
    } else{
        alertString = @"Enter all fields"; }
    if (success == NO) {
    
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:alertString
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)findButton:(id)sender {
    
    NSArray *data = [[DBManager getSharedInstance]findByRegisterNumber: self.searchStudentField.text];
    if (data == nil) {
        
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Data not found"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        self.regNumberField.text = @"";
        self.nameField.text =@"";
        self.departmentField.text = @"";
        self.yearField.text =@"";
    } else{
        self.regNumberField.text = self.searchStudentField.text;
        self.nameField.text =[data objectAtIndex:0];
        self.departmentField.text = [data objectAtIndex:1];
        self.yearField.text =[data objectAtIndex:2];
    }
}
@end
