//
//  ViewController2.h
//  PersonDetailsUsingTableView
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController2 : ViewController<UITableViewDelegate,UITableViewDataSource>

-(void) receiveData:(NSArray*) sendArray;
@property NSArray* rcvArray;

@end
