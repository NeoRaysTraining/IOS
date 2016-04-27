//
//  ViewController.m
//  CustomTableViewCell
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "CustomCellTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *fruits;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _fruits = @[@"apple",@"mango",@"orange",@"grapes"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _fruits.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
       CustomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.displayImg.image=[UIImage imageNamed:_fruits[indexPath.row]];
    cell.displayImg.layer.cornerRadius = cell.displayImg.frame.size.width /2;
    cell.displayImg.clipsToBounds=YES;
    
    cell.titleLbl.text = _fruits[indexPath.row];
    cell.descLbl.text=@"hgaegdukqwfeudhgvbscbxjhqvweuf";
    return cell;
}





@end
