//
//  ModalClass.h
//  AllMyPasswords
//
//  Created by test on 17/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModalClass : NSCoder<NSCoding>
@property(strong,nonatomic)NSString *title;
@property(strong,nonatomic)NSString *password;
@property(strong,nonatomic)NSString *userName;
@property(strong,nonatomic)NSString *notes;
@property(strong,nonatomic)NSData *picture;

- (void)encodeWithCoder:(NSCoder *)aCoder;
- ( instancetype)initWithCoder:(NSCoder *)aDecoder;

-(instancetype)initiWithTitle : (NSString*)title : (NSString*)username : (NSString*)password : (NSString*)notes : (NSData*)picture;
@end
