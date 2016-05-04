//
//  TableViewController.h
//  GettingTheValueAtParticularIndexUsingDelegateMethod
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TableViewController;

@protocol departmentDelegate <NSObject>

-(void)selectWith:(TableViewController *)controller department:(NSString *)deptName;

@end

@interface TableViewController : UITableViewController

@property (nonatomic,strong) id <departmentDelegate>delegate;

@end
