//
//  ViewController.h
//  CoreDataCrudOperation
//
//  Created by test on 5/7/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tabelView;
@property (nonatomic,strong)NSIndexPath *path;
@property(nonatomic,strong)NSMutableArray *empDetailsObject;

@end

