//
//  ViewController.h
//  StoringDataTaskInCoreData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISearchBarDelegate>

@property(strong,nonatomic)NSMutableArray* modelArray;
@property(nonatomic,strong)NSMutableArray *filterString;
@property BOOL ISFiltered;;
@end

