//
//  ViewController2.h
//  ScrollViewDemo
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;

-(void) recieveData:(NSArray*) addNewInfo;
@property (nonatomic,strong)NSArray* rcvDetails;
@property(strong, nonatomic)NSMutableArray *empDetailsArray;

@end
