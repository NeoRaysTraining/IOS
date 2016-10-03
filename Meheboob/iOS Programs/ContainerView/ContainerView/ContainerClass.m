//
//  ContainerClass.m
//  ContainerView
//
//  Created by Mahaboobsab Nadaf on 03/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ContainerClass.h"

@implementation ContainerClass
-(void)viewDidLoad{

    
    self.iPhones = [[NSArray alloc] initWithObjects:@"iPhone 4s",@"iPhone 5",@"iPhone 5s",@"iPhone 6",@"iPhone 6s",@"iPhone 6sPlus",@"iPhone 7",@"iPhone 7s", nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.iPhones.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.iPhones objectAtIndex:indexPath.row]];
    
    return cell;
}
@end
