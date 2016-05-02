//
//  ViewController.h
//  TabelViewTasks
//
//  Created by test on 5/1/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *listOFTasks;



@end

