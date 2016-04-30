//
//  ViewController.m
//  TableViewCellDisplayFoodDetails
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ViewController2.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray* foodItems;
@property (nonatomic,strong) NSArray* imgNames;
@property (nonatomic,strong) NSString* desc;
@property long rowNum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _foodItems=@[@"Idli",@"Dosa",@"Puliogare"];
    _imgNames=@[@"idli",@"dosa",@"puliogare"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _rowNum=indexPath.row;
    [self performSegueWithIdentifier:@"Segue1" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC2 = [segue destinationViewController];
    [VC2 receiveData:self.foodItems:self.imgNames:self.desc:self.rowNum];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _foodItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.titleLbl.text=_foodItems[indexPath.row];
        cell.imgOutlet.image=[UIImage imageNamed:_imgNames[indexPath.row]];
    cell.descLbl.text=@"Break fast";
    _desc=cell.descLbl.text;
    return  cell;
}

@end
