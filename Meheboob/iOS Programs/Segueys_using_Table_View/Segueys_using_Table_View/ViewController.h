//
//  ViewController.h
//  Segueys_using_Table_View
//
//  Created by test on 28/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell2.h"
#import "ViewController2.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)NSArray *placeNames;
@property(strong, nonatomic)NSArray *placeImages;



@end

