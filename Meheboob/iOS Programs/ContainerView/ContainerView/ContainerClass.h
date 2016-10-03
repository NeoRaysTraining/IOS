//
//  ContainerClass.h
//  ContainerView
//
//  Created by Mahaboobsab Nadaf on 03/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerClass : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(strong,nonatomic)NSArray *iPhones;
@end
