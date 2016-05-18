//
//  ViewController.h
//  DownloadTaskUsingJSON
//
//  Created by Mahaboobsab Nadaf on 18/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic)NSMutableArray *artistName;
@property(strong, nonatomic)NSMutableArray *artistID;
@property(strong, nonatomic)NSArray *artistsObject;


@property (weak, nonatomic) IBOutlet UITableView *MyTableView;
- (IBAction)downLoad:(id)sender;
- (IBAction)delete:(id)sender;

@end

