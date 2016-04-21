//
//  ViewController2.h
//  SeguesDemo
//
//  Created by test on 4/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface ViewController2 : UIViewController

@property (nonatomic,strong)NSString* receiveName;

@property (nonatomic,strong)NSString* receivePassword;

@property (weak, nonatomic) IBOutlet UILabel *receivedNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *receivedPasswordLabel;

-(void)receiveNameandPassWord : (NSString *)receivedName : (NSString *)ReceivedPassword;



@end
