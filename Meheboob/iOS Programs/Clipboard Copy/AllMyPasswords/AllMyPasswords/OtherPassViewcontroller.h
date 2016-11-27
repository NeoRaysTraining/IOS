//
//  OtherPassViewcontroller.h
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 23/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface OtherPassViewcontroller : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(strong,nonatomic)NSMutableArray *nameArray;
@property(strong,nonatomic)NSMutableArray *nameValues;
- (IBAction)addButton:(id)sender;
@property(strong,nonatomic)NSMutableArray *imageArray;

@property(strong,nonatomic)NSMutableArray *allObjects;
@end
