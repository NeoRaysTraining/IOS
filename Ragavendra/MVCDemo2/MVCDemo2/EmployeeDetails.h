//
//  EmployeeDetails.h
//  MVCDemo2
//
//  Created by Raghavendra Dattwad on 5/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeDetails : NSObject
@property(nonatomic,assign)NSString  * eID;
@property (nonatomic,strong)NSString *ename;
@property(nonatomic,assign)NSString *empPhoneNum;
@property(nonatomic,strong)NSString *empPlace;


- (instancetype)initEId:(NSString *)employeeID  name:(NSString *)employeName     phoneNum:(NSString *) employeePhoneNumber place:(NSString *)employeePlace;
    



        
   


@end
