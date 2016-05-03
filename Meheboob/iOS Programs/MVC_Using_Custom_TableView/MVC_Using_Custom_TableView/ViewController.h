//
//  ViewController.h
//  MVC_Using_Custom_TableView
//
//  Created by Meheboob Nadaf on 03/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeClass.h"
#import "TableViewCell.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic)NSMutableArray *employeeDetails;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

