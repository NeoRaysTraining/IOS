//
//  EmployeeModel.h
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeModel : NSObject


@property(nonatomic,strong)NSString *empName,*empDOB,*empDesignation,*empPhoneNumber;

- (instancetype)initWithName:(NSString *)name dob:(NSString *)dob designation:(NSString *)desig phoneNo:(NSString *)phoneNo;

@end
