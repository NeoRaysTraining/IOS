//
//  ViewController.h
//  NSURLSessionAndSearch
//
//  Created by test on 20/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UIScrollViewDelegate>

@property(strong, nonatomic)NSURLSession *session;
@property(strong, nonatomic)NSURLSessionDataTask *dataTask;

- (IBAction)Cancel:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@end

