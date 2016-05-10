//
//  ViewController.h
//  CoreDataEmployeeCrudOperation
//
//  Created by test on 5/10/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property(nonatomic,strong)NSMutableArray *empDetailsObject;
@property (nonatomic,strong)NSIndexPath *path;

@end

