//
//  ViewController.m
//  TableViewCheckBoxExampleDemo
//
//  Created by test on 5/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray=[[NSMutableArray alloc]init];
    [dataArray addObject:@"Apple"];
    [dataArray addObject:@"Mango"];
    [dataArray addObject:@"Papaya"];
    [dataArray addObject:@"guava"];
    [dataArray addObject:@"pineapple"];
    [dataArray addObject:@"Banana"];
    [dataArray addObject:@"watermelon"];
    [dataArray addObject:@"jackfruit"];
    [dataArray addObject:@"Butter fruit"];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text=[dataArray objectAtIndex:indexPath.row];
    return cell;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 3;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"user selected %@",[dataArray objectAtIndex:indexPath.row]);
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"user deselected %@",[dataArray objectAtIndex:indexPath.row]);
}


-(void)didTapCheckBtn:(id)sender
{
    [self.myTableView setEditing:YES animated:YES];
}
@end
