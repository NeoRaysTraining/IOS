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
@property (nonatomic,strong) NSMutableArray* taskNames;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic,strong) NSString* newtask;
@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _taskNames = [NSMutableArray arrayWithObjects:nil];
    
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
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.nameLbl.text=_taskNames[indexPath.row];
    return cell;
}


static int flag=0;
- (IBAction)addAction:(id)sender {
    flag++;
    if(flag<1000)
    {
    _newtask   = [NSString stringWithFormat:@"Task %i",flag];
        NSLog(@"%i string is added is added",flag);
        [_taskNames addObject:_newtask];
        NSLog(@"array is %@",_taskNames);
   }
    [_tableViewOutlet reloadData];
}

- (IBAction)tapGestureAction:(id)sender {
    
    [self.taskNames removeObjectAtIndex:0];
    [_tableViewOutlet reloadData];
}

@end
