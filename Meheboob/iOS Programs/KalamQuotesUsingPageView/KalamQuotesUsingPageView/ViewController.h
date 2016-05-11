//
//  ViewController.h
//  KalamQuotesUsingPageView
//
//  Created by test on 11/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentViewController.h"
@interface ViewController : UIViewController<UIPageViewControllerDataSource>

- (IBAction)startAgain:(id)sender;
@property(strong, nonatomic)UIPageViewController *myPageViewController;
@property(strong, nonatomic)NSArray *titlesArray;
@property(strong, nonatomic)NSArray *imagesArray;

@end

