//
//  ViewController.m
//  UITableViewUsingUIAlertcontroller
//
//  Created by test on 02/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tasksList = [[NSMutableArray alloc]init];
    self.allDates = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

   
    return self.tasksList.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
  cell.textLabel.font =   [UIFont systemFontOfSize:28.0];
    
    cell.textLabel.text = [self.tasksList objectAtIndex:indexPath.row];
    
    
    
   
    
    
    

    
    cell.detailTextLabel.text = [self.allDates objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)addTask:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Please Enter Details"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];

    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Task", @"Task");
         
       
     }];
    
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                            
                  UITextField *login = alertController.textFields.firstObject;
                                                              
                                                              [self.tasksList addObject:login.text];
                                              
                                                              
                                                              
                                                              NSDate *localDate = [NSDate date];
                                                              NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
                                                              dateFormatter.dateFormat = @"HH:mm:ss MM/dd/yy";
                                                              
                                                              NSString *dateString = [dateFormatter stringFromDate: localDate];
                                                              [self.allDates addObject:dateString];
                                                              [self.myTableView reloadData];
                                                              
                                                              NSLog(@"Tasks list : %@",self.tasksList);
                                                              
                                                              
                                                          }];
    
    
    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}





-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{

    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tasksList removeObjectAtIndex:indexPath.row];
        [self.myTableView reloadData];
    }
}




@end
