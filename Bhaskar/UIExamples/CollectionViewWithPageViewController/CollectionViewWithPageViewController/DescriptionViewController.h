//
//  DescriptionViewController.h
//  CollectionViewWithPageViewController
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionViewController : UIViewController


@property (nonatomic,strong) UIPageViewController *pageViewController;

@property (nonatomic,strong) NSArray *shirts;

-(void)receiveItem:(int)productDetails;
@end
