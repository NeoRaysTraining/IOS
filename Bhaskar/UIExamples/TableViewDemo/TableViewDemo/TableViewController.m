//
//  TableViewController.m
//  TableViewDemo
//
//  Created by test on 4/25/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    cell.textLabel.text=@"ABC";
    
    cell.detailTextLabel.text=@"122";
    
    return cell;
}

@end
