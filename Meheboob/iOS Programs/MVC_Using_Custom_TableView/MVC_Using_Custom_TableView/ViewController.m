//
//  ViewController.m
//  MVC_Using_Custom_TableView
//
//  Created by Meheboob Nadaf on 03/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController{

    EmployeeClass *employeeModel;
    TableViewCell *cell;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    self.employeeDetails = [[NSMutableArray alloc]init];
    
    EmployeeClass *meheboob = [[EmployeeClass alloc]initWithName:@"Meheboob" initWithAge:@"23" initWithDesignation:@"iOS Developer" initWithPhone:@"8792269791"];
    
    EmployeeClass *bhagya = [[EmployeeClass alloc]initWithName:@"Bhagyashree" initWithAge:@"27" initWithDesignation:@"iOS Developer" initWithPhone:@"8792261420"];
    
    EmployeeClass *raghu = [[EmployeeClass alloc]initWithName:@"Raghavendra" initWithAge:@"25" initWithDesignation:@"iOS Developer" initWithPhone:@"9686123123"];
    
    EmployeeClass *bhaskar = [[EmployeeClass alloc]initWithName:@"Bhaskar" initWithAge:@"26" initWithDesignation:@"iOS Developer" initWithPhone:@"8792269143"];
    
    
    [self.employeeDetails addObjectsFromArray:@[meheboob,bhaskar,bhagya,raghu]];
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  self.employeeDetails.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    employeeModel = self.employeeDetails[indexPath.row];
    
   cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.nameLabel.text = employeeModel.employeeName;
      cell.ageLebel.text = employeeModel.employeeAge;
    cell.designationLabel.text = employeeModel.employeeDesignation;
    cell.phoneLabel.text = employeeModel.employeePhone;
    
    return cell;

}










- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
}











-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.employeeDetails removeObjectAtIndex:indexPath.row];
        [self.myTableView reloadData];
    }
}









- (IBAction)addButton:(id)sender {
    
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Please Enter Details"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
   
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
        
         textField.placeholder = NSLocalizedString(@"Enter Name", @"Name");
         
         
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Age", @"Age");
         
         
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Designation", @"Desc");
         
         
         
     }];
    
    
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Phone", @"Phone");
         
         
         
     }];
    
   
   
    
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              
                                                              UITextField *empName = alertController.textFields[0];
                                                          
                                                              
                                            UITextField *empAge = alertController.textFields[1];
                                                              
                                                              
                                                              UITextField *empDes = alertController.textFields[2];
                                                              
                                                               UITextField *empPho = alertController.textFields[3];
                                                              
                                                              
                                                              NSString *eName =  empName.text;
                                                              
                                                                     NSString *eAge =  empAge.text;
                                                              
                                                              
                                                                 NSString *eDesignation =  empDes.text;
                                                              
                                                                    NSString *ePhone =  empPho.text;
                                                              
                                                              ;
                                                              
                                                              
                                                              

                                                              EmployeeClass *newObject = [[EmployeeClass alloc]initWithName:    eName  initWithAge: eAge initWithDesignation: eDesignation initWithPhone:ePhone];
                                                              
                                                              
                                                              [self.employeeDetails addObjectsFromArray:@[newObject]];
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              [self.myTableView reloadData];
                                                              
                                                              
                                                              
                                                              
                                                          }];
    
    
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    
    
    
    [alertController addAction:defaultAction];
    
     [alertController addAction:cancelAction];
    
    
    [self presentViewController:alertController animated:YES completion:nil];

}




















-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    employeeModel = self.employeeDetails[indexPath.row];
    
    
    
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Please Re - Enter Details"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         // UITextField *textField = alertController.textFields[4];
         textField.placeholder = NSLocalizedString(@"Enter Name", @"Name");
         
         textField.text = employeeModel.employeeName;
         
         
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Age", @"Age");
         
              textField.text = employeeModel.employeeAge;
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Designation", @"Desc");
         
              textField.text = employeeModel.employeeDesignation;
         
     }];
    
    
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Phone", @"Phone");
         
              textField.text = employeeModel.employeePhone;
         
     }];
    
    
    
    
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              
                                                              UITextField *empName = alertController.textFields[0];
                                                              
                                                              
                                                              UITextField *empAge = alertController.textFields[1];
                                                              
                                                              
                                                              UITextField *empDes = alertController.textFields[2];
                                                              
                                                              UITextField *empPho = alertController.textFields[3];
                                                              
                                                              
                                                              NSString *eName =  empName.text;
                                                              
                                                              NSString *eAge =  empAge.text;
                                                              
                                                              
                                                              NSString *eDesignation =  empDes.text;
                                                              
                                                              NSString *ePhone =  empPho.text;
                                                              
                                                              ;
                                                              
   
                                                              
                                                              
                                                              
                                                              
                                                              EmployeeClass *newObject = [[EmployeeClass alloc]initWithName:    eName  initWithAge: eAge initWithDesignation: eDesignation initWithPhone:ePhone];
                                                              
                                                              
                                                              [self.employeeDetails replaceObjectAtIndex:indexPath.row withObject:newObject];
                                                              
                                                              
                                                    
                                                              
                                                              
                                                              [self.myTableView reloadData];
                                                              
                                                              
                                                              
                                                              
                                                          }];
    
    
    
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                   
                                   }];
    
    

    
    
    
    [alertController addAction:defaultAction];
    [alertController addAction:cancelAction];

    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
    
    
    
    
    
    
    
    
    
    
}















@end
