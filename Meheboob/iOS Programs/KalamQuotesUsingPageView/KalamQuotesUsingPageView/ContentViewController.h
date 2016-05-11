//
//  ContentViewController.h
//  KalamQuotesUsingPageView
//
//  Created by test on 11/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface ContentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelField;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewField;

@property NSUInteger pageIndex;
@property(strong, nonatomic)NSString *imageTitle;
@property(strong, nonatomic)NSString *imageImage;

@end
