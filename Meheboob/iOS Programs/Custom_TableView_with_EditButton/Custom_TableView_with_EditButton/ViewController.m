//
//  ViewController.m
//  Custom_TableView_with_EditButton
//
//  Created by test on 05/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    EmployeeClass *employeeModel;
    TableViewCell *cell;
    NSString *errorMessage;
    
    NSString *eName;
    NSString *eAge;
    NSString *eDesignation;
    NSString *ePhone;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
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
    cell.ageLabel.text = employeeModel.employeeAge;
    cell.designationLabel.text = employeeModel.employeeDesignation;
    cell.phoneLabel.text = employeeModel.employeePhone;
    
    
    
    

    return cell;
    
}


- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender {
    
    CGPoint loc = [sender locationInView:self.myTableBiew];
    
    self.selectedPath = [self.myTableBiew indexPathForRowAtPoint:loc];
    cell = [self.myTableBiew cellForRowAtIndexPath:self.selectedPath];
    cell.editButtonOutlet.hidden = NO;
    cell.deleteButtonOutlet.hidden = NO;
}



- (IBAction)editButton:(id)sender {
    
    
    employeeModel = self.employeeDetails[self.selectedPath.row];
    
    
    
    
    
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
                                                              
                                                              
                                                              NSString *  eeName =  empName.text;
                                                              
                                                              NSString *eeAge =  empAge.text;
                                                              
                                                              
                                                              NSString *eeDesignation =  empDes.text;
                                                              
                                                               NSString * eePhone =  empPho.text;
                                                              
                                                              ;
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              EmployeeClass *newObject = [[EmployeeClass alloc]initWithName:    eeName  initWithAge: eeAge initWithDesignation: eeDesignation initWithPhone:eePhone];
                                                              
                                                              
                                                              [self.employeeDetails replaceObjectAtIndex:self.selectedPath.row withObject:newObject];
                                                              
                                                              
                                                              
                                                              
                                                              
                                                              [self.myTableBiew reloadData];
                                                              
                                                              
                                                     cell.editButtonOutlet.hidden = YES;
                                                              cell.deleteButtonOutlet.hidden = YES;
                                                              
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














- (IBAction)deleteButton:(id)sender {
    
    [self.employeeDetails removeObjectAtIndex:self.selectedPath.row];
    
    cell.editButtonOutlet.hidden = YES;
    cell.deleteButtonOutlet.hidden = YES;
           [self.myTableBiew reloadData];
    
}

- (IBAction)swipeRight:(id)sender {
    
    CGPoint loc = [sender locationInView:self.myTableBiew];
    
    self.selectedPath = [self.myTableBiew indexPathForRowAtPoint:loc];
    cell = [self.myTableBiew cellForRowAtIndexPath:self.selectedPath];
    cell.editButtonOutlet.hidden = YES;
    cell.deleteButtonOutlet.hidden = YES;
}






 - (IBAction)addButton:(id)sender {
    
     [self clearData];
  UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Please Enter Details"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         
         textField.placeholder = NSLocalizedString(@"Enter Name", @"Name");
         textField.text = eName;
         
         
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Age", @"Age");
         textField.text = eAge;
         
         
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Designation", @"Desc");
         textField.text = eDesignation;
         
         
         
     }];
    
    
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Phone", @"Phone");
         textField.text = ePhone;
         
         
         
     }];
    
    
    
    
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              
                                                              UITextField *empName = alertController.textFields[0];
                                                              
                                                              
                                                              UITextField *empAge = alertController.textFields[1];
                                                              
                                                              
                                                              UITextField *empDes = alertController.textFields[2];
                                                              
                                                              UITextField *empPho = alertController.textFields[3];
                                                              
                                                              
                                                              eName =  empName.text;
                                                              
                                                              eAge =  empAge.text;
                                                              
                                                              
                                                              eDesignation =  empDes.text;
                                                              
                                                              ePhone =  empPho.text;
                                                              
                                                              ;
                                                              
       
                                                              
                                                              
                                                              
                                                              
                                                              
         
                                                              if ([eName isEqualToString:@""]) {
                                                                  
                                                                  
                                                               errorMessage = @"Plese Enter Employee Name";
                                                                  
                                                                  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Eorror"
                                                                                                                                 message:errorMessage
                                                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                                                  
                                                                  UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                                                                        handler:^(UIAlertAction * action) {
                                                                                                                        
                                                                                                                        
                                                                                                                            [self addButton:sender];
                                                                                                                            
                                                                                                                            [self.employeeDetails removeLastObject];
                                                                                                                            
                                                                                                                            [self.myTableBiew reloadData];
                                                                                                                        
                                                                                                                        }];

                                                                  
                                                                  
                                                                  [alert addAction:defaultAction];
                                                                  [self presentViewController:alert animated:YES completion:nil];

                                                                  
                                               }
                                                                  
                                                                  
                                                                  
                                                                  
                                                              
                                                              
                                 
                                                              if ([eAge isEqualToString:@""]) {
                                                                  
                                                                  
                                                                  errorMessage = @"Plese Enter Age";
                                                                  
                                                                  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Eorror"
                                                                                                                                 message:errorMessage
                                                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                                                  
                                                                  UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                                                                        handler:^(UIAlertAction * action) {
                                                                                                                            
                                                                                                                            
                                                                                                                            [self addButton:sender];
                                                                                                                            
                                                                                                                            [self.employeeDetails removeLastObject];
                                                                                                                            
                                                                                                                            [self.myTableBiew reloadData];
                                                                                                                            
                                                                                                                        }];
                                                                  
                                                                  
                                                                  
                                                                  [alert addAction:defaultAction];
                                                                  [self presentViewController:alert animated:YES completion:nil];
                                                                  
                                                                  
                                                              }
                                                              
                                                          
                                                              
                                                              
                                                              

                                                              
                                                              
                                                              if ([eDesignation isEqualToString:@""]) {
                                                                  
                                                                  
                                                                  errorMessage = @"Plese Enter Designation";
                                                                  
                                                                  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Eorror"
                                                                                                                                 message:errorMessage
                                                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                                                  
                                                                  UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                                                                        handler:^(UIAlertAction * action) {
                                                                                                                            
                                                                                                                            
                                                                                                                            [self addButton:sender];
                                                                                                                            
                                                                                                                            [self.employeeDetails removeLastObject];
                                                                                                                            
                                                                                                                            [self.myTableBiew reloadData];
                                                                                                                            
                                                                                                                        }];
                                                                  
                                                                  
                                                                  
                                                                  [alert addAction:defaultAction];
                                                                  [self presentViewController:alert animated:YES completion:nil];
                                                                  
                                                                  
                                                              }
                                                              
                                                              if ([ePhone isEqualToString:@""]) {
                                                                  
                                                                  
                                                                  errorMessage = @"Plese Enter Phone Number";
                                                                  
                                                                  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Eorror"
                                                                                                                                 message:errorMessage
                                                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                                                  
                                                                  UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                                                                        handler:^(UIAlertAction * action) {
                                                                                                                            
                                                                                                                            
                                                                                                                            [self addButton:sender];
                                                                                                                            
                                                                                                                            [self.employeeDetails removeLastObject];
                                                                                                                            
                                                                                                                            [self.myTableBiew reloadData];
                                                                                                                            
                                                                                                                        }];
                                                                  
                                                                  
                                                                  
                                                                  [alert addAction:defaultAction];
                                                                  [self presentViewController:alert animated:YES completion:nil];
                                                                  
                                                                  
                                                              }
                                                              if ([ePhone isEqualToString:@""]) {
                                                                  
                                                                  
                                                                  errorMessage = @"Plese Enter Phone Number";
                                                                  
                                                                  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Eorror"
                                                                                                                                 message:errorMessage
                                                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                                                  
                                                                  UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                                                                        handler:^(UIAlertAction * action) {
                                                                                                                            
                                                                                                                            
                                                                                                                            [self addButton:sender];
                                                                                                                            
                                                                                                                            [self.employeeDetails removeLastObject];
                                                                                                                            
                                                                                                                            [self.myTableBiew reloadData];
                                                                                                                            
                                                                                                                        }];
                                                                  
                                                                  
                                                                  
                                                                  [alert addAction:defaultAction];
                                                                  [self presentViewController:alert animated:YES completion:nil];
                                                                  
                                                                  
                                                              }
                                                              
                                                              EmployeeClass *newObject = [[EmployeeClass alloc]initWithName:    eName  initWithAge: eAge initWithDesignation: eDesignation initWithPhone:ePhone];
                                                              
                                                              
                                                              [self.employeeDetails addObjectsFromArray:@[newObject]];
                                                              
                                                  
                                                              
                                                              
                                         
                                                              [self.myTableBiew reloadData];
                                                              
                                                              
                                                              
                                                              
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



-(void)clearData{


   if (![eName  isEqual: @""] && ![ePhone  isEqual: @""] && ![eDesignation  isEqual: @""] && ![eAge  isEqual: @""]){
        
        eName = nil;
        
           ePhone = nil;
           eDesignation = nil;
        eAge = nil;
        
        
        
    }

}





@end
