//
//  ViewController2.h
//  WeatherApp
//
//  Created by test on 6/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@protocol dataTransferProtocol;
@interface ViewController2 : UIViewController
@property (nonatomic,weak) id<dataTransferProtocol> delegate;
@end
