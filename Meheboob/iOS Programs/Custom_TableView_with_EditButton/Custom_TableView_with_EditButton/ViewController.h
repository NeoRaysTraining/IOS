//
//  ViewController.h
//  Custom_TableView_with_EditButton
//
//  Created by test on 05/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeClass.h"
#import "TableViewCell.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *myTableBiew;
@property(strong, nonatomic)NSMutableArray *employeeDetails;
@property(strong, nonnull)NSIndexPath *selectedPath;

- (IBAction)swipeLeft:(id)sender;


- (IBAction)editButton:(id)sender;

- (IBAction)deleteButton:(id)sender;

- (IBAction)swipeRight:(id)sender;


@end

