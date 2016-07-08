//
//  ViewController.h
//  WeatherApp
//
//  Created by test on 6/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"
@protocol dataTransferProtocol

-(void) setData:(NSString*)data;
@end
@interface ViewController : UIViewController<dataTransferProtocol>


@end

