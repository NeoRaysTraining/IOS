//
//  InitialViewController.h
//  StockExchangeApplicationDemo
//
//  Created by test on 7/18/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *headerView;
- (IBAction)addAtnAction:(id)sender;

@end
