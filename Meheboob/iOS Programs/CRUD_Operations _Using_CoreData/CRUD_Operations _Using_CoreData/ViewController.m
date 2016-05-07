//
//  ViewController.m
//  CRUD_Operations _Using_CoreData
//
//  Created by test on 07/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButton:(id)sender {
    
    
    
    
    
    UIAlertController* controller=[UIAlertController alertControllerWithTitle:@"Add Employee Details" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Name";
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Age";
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Gender";
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Designation";
    }];
    
    
    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UITextField* name = [controller.textFields objectAtIndex:0];
        
        UITextField* age = [controller.textFields objectAtIndex:1];
        
        UITextField* gender = [controller.textFields objectAtIndex:2];
        
        UITextField* designation = [controller.textFields objectAtIndex:3];
        
        
        NSManagedObjectContext* context=[self getContext];
        NSManagedObject* emp=[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
        [emp setValue:name.text forKey:@"name"];
        
        NSString *empAgeConvert = age.text;
        [emp setValue:[NSNumber numberWithInt:empAgeConvert.intValue] forKey:@"age"];
        [emp setValue:gender.text forKey:@"gender"];
        [emp setValue:designation.text forKey:@"designation"];
        NSError* error=nil;
        
        if (![context save:&error
              ]) {
            NSLog(@"Failed to save data");
        }
        else{
            
            NSLog(@"Saved Data");
        }
        
        
        [self fetchData]; 
        
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    
    
    [controller addAction:alertaction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
    [self fetchData];
    [self.myTableView reloadData];
    
    
}

- (IBAction)editButton:(UIButton *)sender {
    
    
    NSManagedObject *employeeObject =[ self.employeeObjects objectAtIndex:self.selectedPath.row];
    
    
    UIAlertController* controller=[UIAlertController alertControllerWithTitle:@"Re-Enter Employee Details" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.text=[employeeObject valueForKey:@"name"];
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text= [NSString stringWithFormat:@"%@",[employeeObject valueForKey:@"Age"]];
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text=[employeeObject valueForKey:@"gender"];
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text=[employeeObject valueForKeyPath:@"designation"];
    }];
    
    
    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UITextField* name = [controller.textFields objectAtIndex:0];
        
        UITextField* age = [controller.textFields objectAtIndex:1];
        
        UITextField* gender = [controller.textFields objectAtIndex:2];
        
        UITextField* designation = [controller.textFields objectAtIndex:3];
        
        
         NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)sender.superview.superview];
        
        
        NSManagedObjectContext* context=[self getContext];
        
        
        [employeeObject setValue:name.text forKey:@"name"];
        
        NSString *empAgeConvert = age.text;
        [employeeObject setValue:[NSNumber numberWithInt:empAgeConvert.intValue] forKey:@"age"];
        [employeeObject setValue:gender.text forKey:@"gender"];
        [employeeObject setValue:designation.text forKey:@"designation"];
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
                                       
                                   }];
    
    
    [controller addAction:alertaction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
    [self fetchData];
    [self.myTableView reloadData];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  self.employeeObjects.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSManagedObject *employee = [self.employeeObjects objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [employee valueForKey:@"name"];
    NSString *ageTemp = [employee valueForKey:@"age"];
    cell.ageLabel.text = [NSString stringWithFormat:@
                          "%i",[ageTemp intValue]];
    cell.genderLabel.text = [employee valueForKey:@"gender"];
    cell.designationLabel.text = [employee valueForKey:@"designation"];
    return cell;
}

-(NSManagedObjectContext *)getContext{

    AppDelegate *App = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App managedObjectContext];
    
    return context;

}





-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    NSError* error=nil;
    
    self.employeeObjects=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    [self.myTableView reloadData];
 
}

- (IBAction)swipeLeft:(UIGestureRecognizer *)sender {
    

    
    CGPoint location = [sender locationInView:self.myTableView];
    self.selectedPath = [self.myTableView indexPathForRowAtPoint:location];
    
    TableViewCell *cell = [self.myTableView cellForRowAtIndexPath:self.selectedPath];
    
    cell.editButtonOutlet.hidden = NO;
    cell.deleteButtonOutlet.hidden = NO;
    
}





- (IBAction)deleteButton:(UIButton*)sender {
    
    
    
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)sender.superview.superview];
    
    NSManagedObjectContext *context = [self getContext];
    
    [context deleteObject:[self.employeeObjects objectAtIndex:indexPath.row]];
    
    NSError *error = nil;
    [context save:&error];
    
    TableViewCell *cell = [_myTableView cellForRowAtIndexPath:indexPath];
    
    [self.employeeObjects removeObjectAtIndex:indexPath.row];
    cell.editButtonOutlet.hidden = YES;
    cell.deleteButtonOutlet.hidden = YES;
    
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
