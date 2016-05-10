//
//  ViewController.h
//  TabelviewTaskCrudOperation
//
//  Created by test on 5/10/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong, nonatomic)NSMutableArray *tasksList;
@property(strong, nonatomic)NSMutableArray *allDates;
@property(strong, nonatomic)NSIndexPath *selectedPath;
@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *numberOfTables;





@end

