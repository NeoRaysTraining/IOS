//
//  ViewController.m
//  CoreDataCrudOperation
//
//  Created by test on 5/7/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "TableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    [self fetchEmployeeDetailsData];
}



- (IBAction)AddButton:(id)sender {
    
UIAlertController* controller=[UIAlertController alertControllerWithTitle:@"Add Employee Details " message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Name";
        
    }];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter age";
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Designation";
    }];
   
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Salary";
    }];
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Place";
    }];

    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UITextField*empname = [controller.textFields objectAtIndex:0];
        
        UITextField* empAge = [controller.textFields objectAtIndex:1];
        
        UITextField*empdesignation = [controller.textFields objectAtIndex:2];
        
        UITextField*empSalary = [controller.textFields objectAtIndex:3];
        
        UITextField*empPlace = [controller.textFields objectAtIndex:4];
        

NSManagedObjectContext *context=[self getContext];

NSManagedObject *empDetails=[NSEntityDescription   insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
[empDetails setValue:empname.text forKey:@"name"];
NSString *ageConverter=empAge.text;
[empDetails setValue:[NSNumber numberWithInt:ageConverter.intValue] forKey:@"age"];
[empDetails setValue:empdesignation.text forKey:@"designation"];
    
    NSString *empSalaryConverter=empSalary.text;
        [empDetails setValue:[NSNumber numberWithInt:empSalaryConverter.intValue] forKey:@"salary"];
    [empDetails setValue:empPlace.text forKey:@"place"];

    NSError *error=nil;

    if ([context save:&error]) {
            [self fetchEmployeeDetailsData];
    }
   
}];

    [controller addAction:alertaction];
    
    [self presentViewController:controller animated:YES completion:nil];

}
        
-(NSArray*)fetchForCheck{
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    NSError* error=nil;
    
    NSArray* array=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    return array;
}





- (IBAction)editButton:(UIButton*)sender {

  NSManagedObject* Emp = self.empDetailsObject[self.path.row];
    
    UIAlertController* controller=[UIAlertController alertControllerWithTitle:@"Editing  Employee Details " message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.text=  [Emp valueForKey:@"name"];
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       
        
        textField.text=  [Emp valueForKey:@"age"];
    
    
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.text=  [Emp valueForKey:@"designation"];
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       
        textField.text=  [Emp valueForKey:@"salary"];
    }];
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text=  [Emp valueForKey:@"place"];
    }];
    
    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UITextField*empname = [controller.textFields objectAtIndex:0];
        
        UITextField* empAge = [controller.textFields objectAtIndex:1];
        
        UITextField*empdesignation = [controller.textFields objectAtIndex:2];
        
        UITextField*empSalary = [controller.textFields objectAtIndex:3];
        
        UITextField*empPlace = [controller.textFields objectAtIndex:4];
        

    NSIndexPath *indexPath = [self.tabelView indexPathForCell:(TableViewCell *)sender.superview.superview];
        
        [Emp setValue:empname.text forKey:@"name"];
        
        NSLog(@"INSIDE EDIT");
        
    NSString *AgeConverter=empAge.text;
    [Emp setValue:[NSNumber numberWithInt:AgeConverter.intValue] forKey:@"age"];
    [Emp setValue:empdesignation.text forKey:@"designation"];
       
    NSString *salaryConverter=empSalary.text;
    [Emp setValue:[NSNumber numberWithInt:salaryConverter.intValue] forKey:@"salary"];
    [Emp setValue:empPlace.text forKey:@"place"];

        
        NSManagedObjectContext* context=[self getContext];
       
        [self.empDetailsObject replaceObjectAtIndex:indexPath.row withObject:Emp];
        NSError* error=nil;
        [context save:&error];
        
   
        TableViewCell* cell = [self.tabelView cellForRowAtIndexPath:indexPath];
        cell.editOutlet.hidden=YES;
        cell.deleteOutlet.hidden=YES;
        [self fetchEmployeeDetailsData];
        
        
    }];
    [controller addAction:alertaction];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)deieteButton:(UIButton *)sender {
    NSIndexPath *indexPath = [self.tabelView indexPathForCell:(TableViewCell *)sender.superview.superview];
    
    NSManagedObjectContext *context=[self getContext];
    [context deleteObject:[self.empDetailsObject objectAtIndex:indexPath.row]];
    NSError* error=nil;
    [context save:&error];
    
    [self.empDetailsObject removeObjectAtIndex:indexPath.row];
    TableViewCell* cell = [self.tabelView cellForRowAtIndexPath:indexPath];
    cell.editOutlet.hidden=YES;
    cell.deleteOutlet.hidden=YES;
    [self.tabelView reloadData];


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.empDetailsObject.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSManagedObject *Emp=self.empDetailsObject[indexPath.row];
    
cell.nameLabel.text=[Emp valueForKey:@"name"];
NSString*agestr=[Emp valueForKey:@"age"];
cell.ageLabel.text=[NSString stringWithFormat:@"%@",agestr];
cell.designationLabel.text=[Emp valueForKey:@"designation"];
    NSString *salarystr=[Emp valueForKey:@"salary"];
cell.salaryLabel.text=[NSString stringWithFormat:@"%@",salarystr];
cell.placeLabel.text=[Emp valueForKey:@"place"];
return cell;
}
- (IBAction)swipeRight:(UIGestureRecognizer *)sender {
    
    CGPoint location=[sender locationInView:self.tabelView];
    NSIndexPath* path = [self.tabelView indexPathForRowAtPoint:location];
    TableViewCell* cell = [self.tabelView cellForRowAtIndexPath:path];
    cell.editOutlet.hidden=YES;
    cell.deleteOutlet.hidden=YES;
}

- (IBAction)swipeLeft:(UIGestureRecognizer *)sender {
    
    
    CGPoint location=[sender locationInView:self.tabelView];
    NSIndexPath* path = [self.tabelView indexPathForRowAtPoint:location];
    TableViewCell* cell = [self.tabelView cellForRowAtIndexPath:path];
    cell.editOutlet.hidden=NO;
    cell.deleteOutlet.hidden=NO;
}




-(void)fetchEmployeeDetailsData{
            
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    NSError* error=nil;
    
    self.empDetailsObject=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    [self.tabelView reloadData];
}

-(NSManagedObjectContext *)getContext{
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=[app managedObjectContext];
    return context;
}
@end
