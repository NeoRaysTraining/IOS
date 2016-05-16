//
//  ViewController.h
//  NSUrlSessionDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic)NSMutableArray* modelArray;
@property (strong,nonatomic)NSArray* jsonArray;
@property(strong,nonatomic)NSArray* json;
@property(strong,nonatomic)NSDictionary* jsonDict;

@end

