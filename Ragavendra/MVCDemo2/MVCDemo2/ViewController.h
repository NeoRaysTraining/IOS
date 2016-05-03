//
//  ViewController.h
//  MVCDemo2
//
//  Created by Raghavendra Dattwad on 5/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeDetails.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *allModelObjects;

@end

