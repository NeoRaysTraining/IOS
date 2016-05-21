//
//  MTViewController.h
//  NSURLSessionAndSearch
//
//  Created by test on 21/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
