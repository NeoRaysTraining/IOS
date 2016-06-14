//
//  searchController.h
//  WhetherApp
//
//  Created by Mahaboobsab Nadaf on 07/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

//This class is used to search new Location


#import <UIKit/UIKit.h>
#import "ViewController.h"

@protocol ViewBProtocol;

@interface searchController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchLocation;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (nonatomic, weak) id<ViewBProtocol> delegate;

@property(strong, nonatomic)NSMutableArray *cityNames;
@property(strong, nonatomic)NSMutableArray *cityCountry;

@property(strong, nonatomic)NSString *cityUrl;

@property (strong, nonatomic)NSDictionary *jsonAPICity;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@end
