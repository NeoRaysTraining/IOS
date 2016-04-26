//
//  ViewController.m
//  custom_TableView_UsingLabel
//
//  Created by test on 26/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.names = [[NSArray alloc]initWithObjects:@"Meheboob",@"Harish",@"Bhaskar",@"Bhagyashree",@"Raghavendra", nil];
    
    self.namesDescription = [[NSArray alloc]initWithObjects:@"dsadnsabcnsabccbdsahjgsabddsaaf",@"sdsafdsfreteyunbvudhte",@"heuyfruewfcmkejciwueyf",@"dhefiureyfurefcklc",@"qiuwqyruewwcnwdcwo", nil];
    
    self.images = [[NSArray alloc]initWithObjects:@"forward",@"back",@"pause",@"play",@"Play-1", nil];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.names count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    cell.topLabel.text = [self.names objectAtIndex:indexPath.row];
    
    cell.bottomLabel.text = [self.namesDescription objectAtIndex:indexPath.row];
    
    cell.imageField.image = [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
    
    

   


    
    cell.imageField.layer.cornerRadius = cell.imageField.frame.size.width / 2;
    
    cell.imageField.layer.cornerRadius = cell.imageField.frame.size.height / 2;
    
    cell.imageField.clipsToBounds = YES;
    
    cell.imageField.layer.borderWidth = 2.0f;
    
    cell.imageField.layer.borderColor = [UIColor redColor].CGColor;
    
    
    return  cell;




}

@end
