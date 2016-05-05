//
//  ViewController2.m
//  ScrollViewDemo
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "TableViewCell.h"

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray* details,*tableViewArray;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _details=[[NSMutableArray alloc]init];
    self.tableViewArray=[[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) recieveData:(NSString*)name:(NSString*)empid:(NSString*)desig:(NSString*)place:(NSString*)mobile:(NSString*)project;
{
    _rcvname=name;
    _rcvempid=empid;
    _rcvdesig=desig;
    _rcvplace=place;
    _rcvmobile=mobile;
    _rcvproject=project;
    
    
    
    _details=[NSMutableArray a]
    _details=[NSMutableArray arrayWithObjects:_rcvname,_rcvempid,_rcvdesig,_rcvplace,_rcvmobile,_rcvproject, nil];
    
    self.tableViewArray=[NSMutableArray arrayWithObject:_details];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSMutableArray *toPrintArray=self.tableViewArray[indexPath.row];
    
    cell.nameLbl.text=[toPrintArray objectAtIndex:0];
    NSLog(@"%@",[toPrintArray objectAtIndex:0]);
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
