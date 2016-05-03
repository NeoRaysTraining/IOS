//
//  EmployeeModel.m
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "EmployeeModel.h"

@implementation EmployeeModel

- (instancetype)initWithName :(NSString*)ename Designation:(NSString*)designamtion:(NSString*)eage:(NSString*)emobile
{
    self = [super init];
    if (self) {
        _empname=ename;
        _desig=designamtion;
        _mobile=emobile;
        _age=eage;
    }
    return self;
}

@end
