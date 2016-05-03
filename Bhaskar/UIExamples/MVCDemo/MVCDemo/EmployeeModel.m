//
//  EmployeeModel.m
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "EmployeeModel.h"

@implementation EmployeeModel
- (instancetype)initWithName:(NSString *)name dob:(NSString *)dob designation:(NSString *)desig phoneNo:(NSString *)phoneNo
{
    self = [super init];
    if (self) {
        self.empName=name;
        self.empDOB=dob;
        self.empDesignation=desig;
        self.empPhoneNumber=phoneNo;
    }
    return self;
}
@end
