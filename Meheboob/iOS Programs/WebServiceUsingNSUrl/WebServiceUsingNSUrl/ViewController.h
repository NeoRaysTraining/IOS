//
//  ViewController.h
//  WebServiceUsingNSUrl
//
//  Created by test on 13/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)NSMutableArray *artistName;
@property(strong, nonatomic)NSMutableArray *artistID;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

