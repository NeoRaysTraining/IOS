//
//  TableViewController.h
//  StaticTableView
//
//  Created by test on 25/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
- (IBAction)mobileSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *mobileSwitchOutlet;

@property (weak, nonatomic) IBOutlet UISwitch *emailButtonoutlet;
- (IBAction)email:(id)sender;

@end
