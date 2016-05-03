//
//  ViewController.h
//  MVC
//
//  Created by test on 03/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeClass.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic) NSMutableArray *employeeDetails;

@end

