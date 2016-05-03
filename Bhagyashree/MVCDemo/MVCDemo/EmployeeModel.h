//
//  EmployeeModel.h
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeModel : NSObject

@property (nonatomic,strong)NSString *empname;
@property (nonatomic,strong)NSString *desig;
@property (nonatomic,strong)NSString *mobile;
@property(nonatomic,strong) NSString *age;

- (instancetype)initWithName :(NSString*)ename Designation:(NSString*)designamtion:(NSString*)eage:(NSString*)emobile;
@end
