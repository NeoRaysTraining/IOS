//
//  ViewController.h
//  CRUD_Operations _Using_CoreData
//
//  Created by test on 07/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "TableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic)NSMutableArray *employeeObjects;
@property(strong, nonatomic)NSIndexPath *selectedPath;

- (IBAction)addButton:(id)sender;

- (IBAction)editButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)deleteButton:(id)sender;
- (IBAction)swipeRight:(id)sender;

@end

