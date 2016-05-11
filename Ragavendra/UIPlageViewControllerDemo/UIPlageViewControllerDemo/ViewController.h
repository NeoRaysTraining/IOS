//
//  ViewController.h
//  UIPlageViewControllerDemo
//
//  Created by test on 5/11/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"
@interface ViewController : UIViewController<UIPageViewControllerDataSource>



@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;


@end

