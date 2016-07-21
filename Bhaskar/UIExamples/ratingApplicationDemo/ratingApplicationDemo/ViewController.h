//
//  ViewController.h
//  ratingApplicationDemo
//
//  Created by test on 7/16/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet RateView *rateView;


@end

