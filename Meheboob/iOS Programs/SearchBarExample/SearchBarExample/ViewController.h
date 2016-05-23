//
//  ViewController.h
//  SearchBarExample
//
//  Created by test on 23/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *MyTableView;

@property(strong, nonatomic)NSMutableArray *artistName;
@property(strong, nonatomic)NSMutableArray *artistID;
@property(strong, nonatomic)NSArray *artistsObject;
- (IBAction)Download:(id)sender;

@end

