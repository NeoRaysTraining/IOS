//
//  SearchViewController.h
//  WeatherAppDemo
//
//  Created by test on 6/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
@protocol SecondDelegate <NSObject>
-(void) secondViewControllerDismissed:(NSString *)stringForFirst;
@end
@interface SearchViewController : UIViewController




@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain) NSString *data;


@end
