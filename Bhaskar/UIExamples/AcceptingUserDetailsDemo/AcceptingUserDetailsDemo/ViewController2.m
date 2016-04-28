//
//  ViewController2.m
//  AcceptingUserDetailsDemo
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "TableViewCell1.h"

@interface ViewController2 ()

@property (strong,nonatomic) NSArray *receivedDetailsArray;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_receivedDetailsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell1 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.nameLbl.text=[NSString stringWithFormat:@"%@",[self.receivedDetailsArray objectAtIndex:0]];
    cell.ageLbl.text=[NSString stringWithFormat:@"%@",[self.receivedDetailsArray objectAtIndex:1]];
    cell.genderLbl.text=[NSString stringWithFormat:@"%@",[self.receivedDetailsArray objectAtIndex:2]];
    cell.countryLbl.text=[NSString stringWithFormat:@"%@",[self.receivedDetailsArray objectAtIndex:3]];
    return  cell;
}


-(void)receivData:(NSArray *)formDetails
{
    _receivedDetailsArray=formDetails;
}
@end
