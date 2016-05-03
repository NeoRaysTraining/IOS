//
//  EmployeeDetails.m
//  MVCDemo2
//
//  Created by Raghavendra Dattwad on 5/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "EmployeeDetails.h"

@implementation EmployeeDetails

-(instancetype)initEId:(NSString*)employeeID name:(NSString *)employeName phoneNum:(NSString *)employeePhoneNumber place:(NSString *)employeePlace{
   
    self =[super init];
    if (self)
    {
        self.eID=employeeID;
        self.ename=employeName;
        self.empPhoneNum=employeePhoneNumber;
        self.empPlace=employeePlace;
    
    
    }
    return self;
}


@end
