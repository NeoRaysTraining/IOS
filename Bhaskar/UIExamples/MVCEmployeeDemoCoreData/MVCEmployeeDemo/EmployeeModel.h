//
//  EmployeeModel.h
//  MVCEmployeeDemo
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeModel : NSObject


@property(nonatomic,strong)NSString *empName,*empDesignation;

- (instancetype)initWithName:(NSString *)name designation:(NSString *) designation;

@end
