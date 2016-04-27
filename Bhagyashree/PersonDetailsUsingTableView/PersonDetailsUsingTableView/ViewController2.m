//
//  ViewController2.m
//  PersonDetailsUsingTableView
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "TableViewCell.h"

@interface ViewController2 ()

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

-(void) receiveData:(NSArray*) sendArray
{
    self.rcvArray=sendArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rcvArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.nameLbl.text=_rcvArray[0];
    cell.ageLbl.text=_rcvArray[1];
    cell.genderLbl.text=_rcvArray[2];
    cell.countryLbl.text=_rcvArray[3];
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
