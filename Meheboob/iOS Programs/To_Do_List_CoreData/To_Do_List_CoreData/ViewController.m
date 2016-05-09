//
//  ViewController.m
//  To_Do_List_CoreData
//
//  Created by Mahaboobsab Nadaf on 08/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tasksList = [[NSMutableArray alloc]init];
    self.allDates = [[NSMutableArray alloc]init];
    
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addButton:(id)sender {
    
    
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
                                                              
                                          
                                                              
                                                              NSManagedObjectContext *context = [self getTheContext];
                                                              
                                     
                                                              
                                       
                                                              NSDate *localDate = [NSDate date];
                                                              NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
                                                              dateFormatter.dateFormat = @"HH:mm:ss MM/dd/yy";
                                                                                                        
                                                              
                                                              
                                                              
                                                              
                                                              NSManagedObject *taskObject = [NSEntityDescription insertNewObjectForEntityForName:@"TaskTable" inManagedObjectContext:context];
                                                              
                                                              [taskObject setValue:login.text forKey:@"task"];
                                                              [taskObject setValue:localDate forKey:@"taskDate"];
                                                              
                                                              
                                                              NSError *error = nil;
                                                              
                                                              if (![context save:&error]) {
                                                                  NSLog(@"Failed to save Data");
                                                              }
                                                              else{
                                                                  NSLog(@"Data Saved");
                                                              
                                                              }
                                                        
                                                           [self fetchData];    
                                                              
                                                          }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    
    

    [alertController addAction:cancelAction];
    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
   
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    self.numberOfTables.title = [NSString stringWithFormat:@"%lu",(unsigned long)self.tasksList.count];
    
    return self.tasksList.count;


}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSManagedObject *taskObject = [self.tasksList objectAtIndex:indexPath.row];
    
    cell.taskName.text = [taskObject valueForKey:@"task"];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"HH:mm:ss MM/dd/yy";
    
    NSString *dateString = [dateFormatter stringFromDate: [taskObject valueForKey:@"taskDate"]];
    
    cell.tasDate.text = dateString;
    
    return cell;
}


-(NSManagedObjectContext *)getTheContext{
    
    
    AppDelegate *App = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App managedObjectContext];
    
    return context;
    
}


-(void)fetchData{
    
    self.numberOfTables.title = [NSString stringWithFormat:@"( %lu )",(unsigned long)self.tasksList.count];
    
    NSManagedObjectContext* context=[self getTheContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"TaskTable"];
    NSError* error=nil;
    
    self.tasksList=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    [self.myTableView reloadData];
    
}




- (IBAction)deleteButton:(UIButton *)sender {
    
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)sender.superview.superview];
    
    NSManagedObjectContext *context = [self getTheContext];
    
    [context deleteObject:[self.tasksList objectAtIndex:indexPath.row]];
    
    NSError *error = nil;
    [context save:&error];
    
    TableViewCell *cell = [_myTableView cellForRowAtIndexPath:indexPath];
    
    [self.tasksList removeObjectAtIndex:indexPath.row];
    cell.editButtonOutlet.hidden = YES;
    cell.deleteButtonOutlet.hidden = YES;
    
    [self.myTableView reloadData];
    
    
}

- (IBAction)swipeLeft:(id)sender {
    
    CGPoint location = [sender locationInView:self.myTableView];
    self.selectedPath = [self.myTableView indexPathForRowAtPoint:location];
    
    TableViewCell *cell = [self.myTableView cellForRowAtIndexPath:self.selectedPath];
    
    cell.editButtonOutlet.hidden = NO;
    cell.deleteButtonOutlet.hidden = NO;
    
}

- (IBAction)editButton:(UIButton *)sender {
    
    
    
    
    
    NSManagedObject *taskObject =[ self.tasksList objectAtIndex:self.selectedPath.row];
    
    
    UIAlertController* controller=[UIAlertController alertControllerWithTitle:@"Re-Enter Employee Details" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.text=[taskObject valueForKey:@"task"];
        
    }];
    
//    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.text= [NSString stringWithFormat:@"%@",[taskObject valueForKey:@"taskDate"]];
//        
//    }];
    

    
    
    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UITextField* taskName = [controller.textFields objectAtIndex:0];
        
       // UITextField* tasksDate = [controller.textFields objectAtIndex:1];
        
        
       // NSString *dateStr;
        
        // Convert string to date object
       // NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
       // [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
        //NSDate *myDate = [dateFormat dateFromString:dateStr];
        
        NSDate *currentDate = [NSDate date];
        
        
        NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)sender.superview.superview];
        
        
        NSManagedObjectContext* context=[self getTheContext];
        
        
        [taskObject setValue:taskName.text forKey:@"task"];
        
        
        [taskObject setValue:currentDate forKey:@"taskDate"];
       
        NSError* error=nil;
        
        if (![context save:&error
              ]) {
            NSLog(@"Failed to save data");
        }
        else{
            
            NSLog(@"Saved Data");
        }
        
        
        
        
        
        
        
        
        TableViewCell *cell = [_myTableView cellForRowAtIndexPath:indexPath];
        
        
        cell.editButtonOutlet.hidden = YES;
        cell.deleteButtonOutlet.hidden = YES;
        [self fetchData];
        
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                          NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)sender.superview.superview];
                                       
                                       TableViewCell *cell = [_myTableView cellForRowAtIndexPath:indexPath];
                                       
                                      
                                       
                                       cell.editButtonOutlet.hidden = YES;
                                       cell.deleteButtonOutlet.hidden = YES;
                                       
                                   }];
    
    
    [controller addAction:alertaction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
    [self fetchData];
    [self.myTableView reloadData];
    
    
    
}

- (IBAction)swipeRight:(id)sender {
    
    CGPoint location = [sender locationInView:self.myTableView];
    self.selectedPath = [self.myTableView indexPathForRowAtPoint:location];
    
    TableViewCell *cell = [self.myTableView cellForRowAtIndexPath:self.selectedPath];
    
    cell.editButtonOutlet.hidden = YES;
    cell.deleteButtonOutlet.hidden = YES;
}
@end
