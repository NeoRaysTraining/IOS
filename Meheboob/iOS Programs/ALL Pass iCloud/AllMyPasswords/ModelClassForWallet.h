//
//  ModelClassForWallet.h
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 25/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelClassForWallet : NSCoder<NSCoding>

@property(strong,nonatomic)NSString *titleOther;
@property(strong,nonatomic)NSString *imageName;
@property(strong,nonatomic)NSData *allKeys;
@property(strong,nonatomic)NSData *allValues;


- (void)encodeWithCoder:(NSCoder *)aCoder;
- ( instancetype)initWithCoder:(NSCoder *)aDecoder;

-(instancetype)initiWithTitle : (NSString*)titleOther : (NSString*)imageName : (NSData*)allKeys : (NSData*)allValues;
@end
