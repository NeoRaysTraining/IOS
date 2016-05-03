//
//  ViewController.m
//  DoListAppUsingTableViewAndGesture
//
//  Created by test on 4/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray* taskNames;
@property (nonatomic,strong) NSMutableArray* taskTime;
@property (nonatomic,strong) NSString *createdate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _taskNames = [[NSMutableArray alloc]init];
    _taskTime = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskNames.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=self.taskNames[indexPath.row];

    NSDate *myDate = [[NSDate alloc]init];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"hh:mm:ss dd/MM/YY";
    _createdate = [format stringFromDate:myDate];
    [_taskTime addObject:_createdate];
    cell.detailTextLabel.text = _taskTime[indexPath.row];
    return cell;
}

- (IBAction)addBotton:(id)sender {
    
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
        
        [self.taskNames addObject:newtask.text];
        [self.tableView reloadData];
    }];
    
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        [_taskNames removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

@end
