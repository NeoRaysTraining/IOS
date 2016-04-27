//
//  ViewController2.m
//  CustomTableViewWithSegue
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "CustomCellTableViewCell.h"

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) receiveData:(NSArray *)employee
{
    self.rcvArray=employee;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rcvArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.nameLbl.text=_rcvArray[0];
    cell.idLbl.text=_rcvArray[1];
    cell.desigLbl.text=_rcvArray[2];
    cell.plcLbl.text=_rcvArray[3];
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
