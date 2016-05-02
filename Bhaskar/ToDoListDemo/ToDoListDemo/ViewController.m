//
//  ViewController.m
//  ToDoListDemo
//
//  Created by test on 4/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *listOfTasks,*dateArr;

@property (nonatomic,strong) NSDate *taskDate;
@property (nonatomic,assign) int taskNumber,selectingTaskToDelete;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSDate *dateStr;

@property (strong,nonatomic) NSString *dateString;
@end
@implementation ViewController
- (IBAction)deleteTask:(id)sender {
    //if (self.taskNumber>=0) {
        [self.listOfTasks removeObjectAtIndex:self.selectingTaskToDelete];
        [self.tableView reloadData];
    //}
    
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.taskNumber=0;
    self.listOfTasks =[[NSMutableArray alloc]init];
    
   
}
- (IBAction)addTasks:(id)sender {
    
    self.taskNumber++;
    NSString *object1=[NSString stringWithFormat:@"Task %d",self.taskNumber];
    [self.listOfTasks addObject:object1];
    self.taskDate=[[NSDate alloc]init];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"EEE, ddd MMM yyy"];
    self.dateString= [format stringFromDate:_taskDate];
    [self.tableView reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listOfTasks.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=self.listOfTasks[indexPath.row];
    //cell.detailTextLabel.text=self.dateString;
    self.taskDate=nil;
        return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectingTaskToDelete=(int)indexPath.row;
    NSLog(@"%i",self.selectingTaskToDelete);
    
    
}

@end
