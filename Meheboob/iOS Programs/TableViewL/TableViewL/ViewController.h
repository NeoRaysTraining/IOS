//
//  ViewController.h
//  TableViewL
//
//  Created by test on 25/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic)NSDictionary *cources;
@property(strong, nonatomic)NSArray *courcesKey;

@property (strong, nonatomic)NSDictionary *courcesWeb;
@property(strong, nonatomic)NSArray *courcesKeyWeb;

@end

