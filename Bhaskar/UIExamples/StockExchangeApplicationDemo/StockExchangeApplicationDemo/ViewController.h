//
//  ViewController.h
//  StockExchangeApplicationDemo
//
//  Created by test on 7/18/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *searchValueTableOutlet;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBarBtnOutlet;


@end

