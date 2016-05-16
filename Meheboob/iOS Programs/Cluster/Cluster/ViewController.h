//
//  ViewController.h
//  Cluster
//
//  Created by test on 15/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Modules.h"
#import "TableViewCell.h"
#import "ContentViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic)NSArray *Contents1;
@property(strong, nonatomic)NSArray *Contents2;
@property(strong, nonatomic)NSArray *Contents3;
@property(strong, nonatomic)NSArray *Contents4;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end

