//
//  ViewController.h
//  TableView_Dynamically_Adding_Values
//
//  Created by test on 30/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic)NSMutableArray *taskArray;
@property(strong, nonatomic)NSString *generetaTask;
@property(assign, nonatomic)int generateNumber;
@property(strong, nonatomic)NSString *task;

- (IBAction)addButton:(id)sender;


- (IBAction)swipeRight:(id)sender;





@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

