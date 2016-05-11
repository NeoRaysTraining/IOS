//
//  ViewController.m
//  DoListAppUsingCoreData
//
//  Created by test on 5/7/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic,strong) NSMutableArray* taskNames;
@property NSIndexPath *indexpath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _taskNames = [[NSMutableArray alloc]init];
    [self fetchData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=[app managedObjectContext];
    return context;
}

-(void) fetchData
{
    NSManagedObjectContext * context
    = [self getContext];
    NSFetchRequest *req = [[NSFetchRequest alloc]initWithEntityName:@"Task"];
    NSError* error = nil;
    self.taskNames = [[NSMutableArray alloc]initWithArray:[context executeFetchRequest:req error:&error]];
    [self.tableViewOutlet reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSManagedObject *taskobj = [self.taskNames objectAtIndex:indexPath.row];
    cell.taskLbl.text=[taskobj valueForKey:@"tname"];
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm:ss MM/dd/YY";
    NSString * datestr = [formatter stringFromDate:[taskobj valueForKey:@"createtime"]];
    cell.timeLbl.text=datestr;
    
//    cell.taskLbl.text=self.taskNames[indexPath.row];
//    
//    NSDate *myDate = [[NSDate alloc]init];
//    NSDateFormatter *format = [[NSDateFormatter alloc]init];
//    format.dateFormat = @"hh:mm:ss dd/MM/YY";
//    _createdate = [format stringFromDate:myDate];
//    [_taskTime addObject:_createdate];
//    cell.timeLbl.text = _taskTime[indexPath.row];
//        
    return cell;
}


- (IBAction)addAction:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Enter new task"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"TaskPlaceholder",@"New Task");
     }];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        UITextField *newtask=alertController.textFields.firstObject;
        
        NSDate *mydate =[NSDate date];
        NSManagedObjectContext *context = [self getContext];
        NSManagedObject *taskobject = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
        [taskobject setValue:newtask.text forKey:@"tname"];
        [taskobject setValue:mydate forKey:@"createtime"];
        
        NSError *error = nil;
        if(![context save:&error])
        {
            NSLog(@"failed");
        }
        else{
            NSLog(@"Saved data");
        }
        [self fetchData];
        
        [self.tableViewOutlet reloadData];
    }];
    
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (IBAction)editAction:(UIButton*)sender {
   
    NSManagedObject* model = self.taskNames[self.indexpath.row];
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Enter new task"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Task name..",@"New Task");
         textField.text=[model valueForKey:@"tname"];
     }];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        UITextField *newtask=alertController.textFields.firstObject;
        
        
        _indexpath = [self.tableViewOutlet indexPathForCell:(TableViewCell *)sender.superview.superview];
        
        NSManagedObjectContext* context=[self getContext];

        
        NSDate *mydate =[NSDate date];
        NSManagedObject *taskobject =[self.taskNames objectAtIndex:_indexpath.row];
        [taskobject setValue:newtask.text forKey:@"tname"];
        [taskobject setValue:mydate forKey:@"createtime"];
        
        NSError *error = nil;
        if(![context save:&error])
        {
            NSLog(@"failed");
        }
        else{
            NSLog(@"Saved data");
        }
        [self fetchData];
        
        [self.tableViewOutlet reloadData];
    }];
    
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (IBAction)leftSwipe:(id)sender {
    NSLog(@"Inside swipe left");
    
    CGPoint loc=[sender locationInView:self.tableViewOutlet];
    self.indexpath = [self.tableViewOutlet indexPathForRowAtPoint:loc];
    TableViewCell *cell=[self.tableViewOutlet cellForRowAtIndexPath:_indexpath];
    cell.editButton.hidden=NO;
    cell.deleteButton.hidden=NO;
    
}
- (IBAction)deleteAction:(UIButton *)sender {

    NSIndexPath *indexPath = [self.tableViewOutlet indexPathForCell:(TableViewCell *)sender.superview.superview];
    NSManagedObjectContext *context =[self getContext];
    [context deleteObject:[self.taskNames objectAtIndex:indexPath.row]];
    NSError* error=nil;
    [context save:&error];
    
    [self.taskNames removeObjectAtIndex:indexPath.row];
    TableViewCell* cell = [self.tableViewOutlet cellForRowAtIndexPath:indexPath];
    cell.editButton.hidden=YES;
    cell.deleteButton.hidden=YES;
    [self.tableViewOutlet reloadData];
    
//    [_taskNames removeObjectAtIndex:_indexpath.row];
//    [_tableViewOutlet reloadData];
}

@end
