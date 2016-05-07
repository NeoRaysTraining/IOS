//
//  EmployeeModel.m
//  MVCEmployeeDemo
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "EmployeeModel.h"

@implementation EmployeeModel

- (instancetype)initWithName:(NSString *)name designation:(NSString *) designation
{
    self = [super init];
    if (self) {
        self.empName=name;
        self.empDesignation=designation;
    }
    return self;
}

@end
