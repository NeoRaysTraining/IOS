//
//  SlideBarTableViewController.m
//  SlideOutSlideBarMenuDemo
//
//  Created by test on 5/25/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "SlideBarTableViewController.h"
#import "BooksViewController.h"

@implementation SlideBarTableViewController
{
    NSArray *menuItems;
}


-(void)viewDidLoad
{
    menuItems=@[@"images",@"Quotes",@"Books",@"FB Fan Page",@"YouTube",@"Bioraphy",@"About Us"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [menuItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return nil;
    NSString *CellIdentifier = [menuItems objectAtIndex:indexPath.row];
    NSLog(@"%@",CellIdentifier);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath=[self.slideMenuTableView indexPathForSelectedRow];
    NSLog(@"%@",indexPath);
    UINavigationController *destViewController=(UINavigationController*)segue.destinationViewController;
    destViewController.title=[[menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    NSLog(@"%@", destViewController);
    NSLog(@"title is %@",destViewController.title);
    
    if ([segue.identifier isEqualToString:@"showBooks"]) {
        NSLog(@"book details");
    }
    
}


@end
