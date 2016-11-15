//
//  AllPasswords.h
//  AllMyPasswords
//
//  Created by Mahaboobsab Nadaf on 14/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "TableViewCell.h"
#import "ImageViewController.h"
@interface AllPasswords : UIViewController<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>




@property(strong, nonatomic)NSMutableArray *employeeObjects;
@property(strong, nonatomic)NSIndexPath *selectedPath;
- (IBAction)buttonImageAction:(UIButton *)sender;

- (IBAction)addButton:(id)sender;
- (IBAction)moreButton:(UIButton *)sender;






- (IBAction)editButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)deleteButton:(id)sender;



@end
