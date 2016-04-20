//
//  ViewController2.h
//  ModalSegue
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ViewController2 : UIViewController
-(void) receiveData:(NSArray*) fruits:(NSString*)item;
@property (nonatomic,strong) NSArray *rcvArray;

@end
