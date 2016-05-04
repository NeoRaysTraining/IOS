//
//  ViewController.h
//  TableView_Different_Sections
//
//  Created by test on 04/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)NSArray *array1;
@property(strong, nonatomic)NSArray *array1Captains;

@property(strong, nonatomic)NSArray *array2;
@property(strong, nonatomic)NSArray *array2Captains;

@property(strong, nonatomic)NSArray *array3;
@property(strong, nonatomic)NSArray *array3Captains;

@end

