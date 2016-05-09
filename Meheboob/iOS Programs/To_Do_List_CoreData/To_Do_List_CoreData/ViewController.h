//
//  ViewController.h
//  To_Do_List_CoreData
//
//  Created by Mahaboobsab Nadaf on 08/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic)NSMutableArray *tasksList;
@property(strong, nonatomic)NSMutableArray *allDates;
@property(strong, nonatomic)NSIndexPath *selectedPath;
- (IBAction)addButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)deleteButton:(id)sender;


- (IBAction)swipeLeft:(id)sender;
- (IBAction)editButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *numberOfTables;

- (IBAction)swipeRight:(id)sender;
@end

