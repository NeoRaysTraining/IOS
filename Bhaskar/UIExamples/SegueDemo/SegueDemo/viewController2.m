//
//  viewController2.m
//  SegueDemo
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "viewController2.h"


@interface viewController2 ()

@property (nonatomic,strong) NSString *recievedName,*recievedPwd;

@end
@implementation viewController2




-(void)viewDidLoad{
    
    NSLog(@"name:%@ \n pwd:%@",self.recievedName,_recievedPwd);
    
    self.dispalayNameText.text=self.recievedName;
    self.displayPasswordText.text=self.recievedPwd;
    
    
    
}

-(void)recieveData:(NSString *)name password:(NSString *)pwd
{
    self.recievedName=name;
    self.recievedPwd=pwd;
}

@end
