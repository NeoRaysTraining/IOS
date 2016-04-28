//
//  ViewController2.h
//  AcceptingUserDetailsDemo
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController2 : UIViewController<UITableViewDelegate,UITableViewDataSource>


-(void)receivData:(NSArray *)formDetails;
@end
