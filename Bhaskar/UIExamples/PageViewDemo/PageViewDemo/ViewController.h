//
//  ViewController.h
//  PageViewDemo
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController<UIPageViewControllerDataSource>

@property (nonatomic,strong) UIPageViewController *pageViewController;
@property (nonatomic,strong) NSArray *pageTitles;
@property (nonatomic,strong) NSArray *pageImages;


@end

