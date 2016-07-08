//
//  ViewController2.h
//  AfNetWithDelegate
//
//  Created by test on 7/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DemoDelegate <NSObject>

-(void) getData:(NSArray*)str;

@end

@interface ViewController2 : UIViewController

@property (nonatomic,strong)id <DemoDelegate> delegate;
-(void)jsonMethod;
@end
