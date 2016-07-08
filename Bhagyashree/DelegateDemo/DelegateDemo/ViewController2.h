//
//  ViewController2.h
//  DelegateDemo
//
//  Created by test on 6/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@protocol DemoDelegate <NSObject>

-(void) getData:(NSString*)str;

@end

@interface ViewController2 : UIViewController

@property (nonatomic,strong)id <DemoDelegate> delegate;

@end
