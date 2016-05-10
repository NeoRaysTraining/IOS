//
//  ViewController.m
//  TabelviewTaskCrudOperation
//
//  Created by test on 5/10/16.
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

    self.allDates=[[NSMutableArray alloc]init];
    self.tasksList=[[NSMutableArray alloc]init];
    [self fetchData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    self.numberOfTables.title = [NSString stringWithFormat:@"%lu",(unsigned long)self.tasksList.count];
        return self.tasksList.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

        NSManagedObject *taskObject = [self.tasksList objectAtIndex:indexPath.row];
    
        cell.taskName.text = [taskObject valueForKey:@"tname"];
    
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = @"HH:mm:ss MM/dd/yy";
    
        NSString *dateString = [dateFormatter stringFromDate: [taskObject valueForKey:@"tdate"]];
    
        cell.taskDate.text = dateString;
    return cell;
}


- (IBAction)Addbutton:(id)sender {

    UIAlertController *alertController = [UIAlertController
    alertControllerWithTitle:@" Enter Details"
    message:@""
    preferredStyle:UIAlertControllerStyleAlert];
    
   [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
    {
    textField.placeholder=@"Enter task";
        }];
    
    
UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
handler:^(UIAlertAction * action) {
                                             
UITextField *login = alertController.textFields.firstObject;
                                            
NSManagedObjectContext *context = [self getContext];
    
NSDate *localDate = [NSDate date];
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
dateFormatter.dateFormat = @" MM/dd/yy";
NSManagedObject *taskObject = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
                                            
[taskObject setValue:login.text forKey:@"tname"];
[taskObject setValue:localDate forKey:@"tdate"];
                                             
                                             
NSError *error = nil;
if (![context save:&error]) {

NSLog(@"Failed to save Data");
}

else{
    NSLog(@" save Data");
    
}
 [self fetchData];
    
}];

    UIAlertAction *cancelAction = [UIAlertAction
        actionWithTitle:NSLocalizedString(@"Cancel", @"")
    style:UIAlertActionStyleCancel
            handler:^(UIAlertAction *action)
    {
                                       
}];
        [alertController addAction:cancelAction];
        [alertController addAction:defaultAction];
        [self presentViewController:alertController animated:YES completion:nil];
}
- (IBAction)editButton:(UIButton *)sender {

    NSManagedObject *taskObject =[ self.tasksList objectAtIndex:self.selectedPath.row];
    
        UIAlertController* controller=[UIAlertController alertControllerWithTitle:@"Edit  Details" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
        [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.text=[taskObject valueForKey:@"tname"];
            
        }];

    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    UITextField* taskName = [controller.textFields objectAtIndex:0];
   
    NSDate *currentDate = [NSDate date];
        
        
NSIndexPath *indexPath = [self.tabelView indexPathForCell:(TableViewCell *)sender.superview.superview];
        
        
NSManagedObjectContext* context=[self getContext];
    
        
[taskObject setValue:taskName.text forKey:@"tname"];
        
        
[taskObject setValue:currentDate forKey:@"tdate"];
        
NSError* error=nil;
        
if (![context save:&error
]) {
    NSLog(@"Error to save ");
}
else{
            
NSLog(@"Save Data");
}
        
TableViewCell *cell = [_tabelView cellForRowAtIndexPath:indexPath];
       
        
    cell.editOutlet.hidden = YES;
    cell.deleteOutlet.hidden = YES;
    [self fetchData];
        
}];
    
    
UIAlertAction *cancelAction = [UIAlertAction

actionWithTitle:NSLocalizedString(@"Cancel", @"")

                               style:UIAlertActionStyleCancel
                                                                           handler:^(UIAlertAction *action)
                                                                          {
NSIndexPath *indexPath = [self.tabelView indexPathForCell:(TableViewCell *)sender.superview.superview];
                                            
TableViewCell *cell = [_tabelView cellForRowAtIndexPath:indexPath];
                                            
                                                                            
                                                                              
cell.editOutlet.hidden = YES;
cell.deleteOutlet.hidden = YES;
                                            
}];
    
    
        [controller addAction:alertaction];
        [controller addAction:cancelAction];
    
[self presentViewController:controller animated:YES completion:nil];
    
    
    [self fetchData];
    [self.tabelView reloadData];
    
}
-(NSManagedObjectContext *)getContext{
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=[app managedObjectContext];
    return context;
}

-(void)fetchData{
    
    self.numberOfTables.title = [NSString stringWithFormat:@"( %lu )",(unsigned long)self.tasksList.count];
    
        NSManagedObjectContext* context=[self getContext];
        NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Task"];
        NSError* error=nil;
    
        self.tasksList=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
        [self.tabelView reloadData];
}


- (IBAction)deleteButton:(UIButton*)sender {
   
    NSIndexPath *indexPath = [self.tabelView indexPathForCell:(TableViewCell *)sender.superview.superview];
    
        NSManagedObjectContext *context = [self getContext];
    
        [context deleteObject:[self.tasksList objectAtIndex:indexPath.row]];
    
        NSError *error = nil;
        [context save:&error];
    
        TableViewCell *cell = [_tabelView cellForRowAtIndexPath:indexPath];
    
        [self.tasksList removeObjectAtIndex:indexPath.row];
        cell.editOutlet.hidden = YES;
        cell.deleteOutlet.hidden = YES;
    
       [self.tabelView reloadData];
}

- (IBAction)swipeRight:(id)sender {

    CGPoint location=[sender locationInView:self.tabelView];
    NSIndexPath* path = [self.tabelView indexPathForRowAtPoint:location];
    TableViewCell* cell = [self.tabelView cellForRowAtIndexPath:path];
    cell.editOutlet.hidden=YES;
    cell.deleteOutlet.hidden=YES;
    

}


- (IBAction)swipeLeft:(id)sender {


    CGPoint loc=[sender locationInView:self.tabelView];
    self.selectedPath = [self.tabelView indexPathForRowAtPoint:loc];
    TableViewCell* cell = [self.tabelView cellForRowAtIndexPath:self.selectedPath];
    cell.editOutlet.hidden=NO;
    cell.deleteOutlet.hidden=NO;



}
@end
