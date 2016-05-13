//
//  PageContentViewController.h
//  CollectionViewWithPageViewController
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *productDescriptionImageView;

@property NSUInteger pageIndex;
@property (nonatomic,strong) NSString *imageFile;

@end
