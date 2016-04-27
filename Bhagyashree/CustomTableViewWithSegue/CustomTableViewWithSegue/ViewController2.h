//
//  ViewController2.h
//  CustomTableViewWithSegue
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ViewController2 : UIViewController
-(void) receiveData:(NSArray*)employee;
@property (nonatomic,strong) NSArray *rcvArray;
@end
