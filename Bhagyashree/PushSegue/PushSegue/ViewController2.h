//
//  ViewController2.h
//  PushSegue
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *pass;
-(void) receiveData:(NSString*)nameStr password:(NSString*)passStr;


@end
