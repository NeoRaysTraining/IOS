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

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.empDetailsArray = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) recieveData:(NSArray*) addNewInfo
{
    _rcvDetails = [[NSArray alloc]init];
    _rcvDetails=addNewInfo;
    
    [self.empDetailsArray addObject:_rcvDetails];
    [self.tableViewOutlet reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rcvDetails.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //[self.empDetailsArray addObject:_rcvDetails];
    
    NSLog(@"%@",self.empDetailsArray);
    NSMutableArray *temp = [self.empDetailsArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@",temp);
    cell.nameLbl.text=temp[0];
    cell.idLbl.text=temp[1];
    cell.desigLbl.text=temp[2];
    cell.placeLbl.text=temp[3];
    cell.mobileLbl.text=temp[4];;
    cell.projLbl.text=temp[5];
    
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
