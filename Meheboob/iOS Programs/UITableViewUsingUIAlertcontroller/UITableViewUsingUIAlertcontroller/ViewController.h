//
//  ViewController.h
//  UITableViewUsingUIAlertcontroller
//
//  Created by test on 02/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic)NSMutableArray *tasksList;
@property(strong, nonatomic)NSMutableArray *allDates;

- (IBAction)addTask:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

