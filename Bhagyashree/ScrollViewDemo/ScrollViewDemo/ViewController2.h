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

-(void) recieveData:(NSString*)name:(NSString*)empid:(NSString*)desig:(NSString*)place:(NSString*)mobile:(NSString*)project;
@property (nonatomic,strong) NSString* rcvname;
@property (nonatomic,strong) NSString* rcvempid;
@property (nonatomic,strong) NSString* rcvdesig;
@property (nonatomic,strong) NSString* rcvplace;
@property (nonatomic,strong) NSString* rcvmobile;
@property (nonatomic,strong) NSString* rcvproject;



@end
