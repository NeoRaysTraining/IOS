//
//  ModelClassForWallet.m
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 25/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ModelClassForWallet.h"

@implementation ModelClassForWallet
-(instancetype)initiWithTitle : (NSString*)title : (NSString*)imageName : (NSData*)allKeys : (NSData*)allValues{
    
    self.titleOther = title;
    self.imageName = imageName;
    self.allKeys = allKeys;
    self.allValues = allValues;
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:self.titleOther forKey:@"titleOther"];
    [encoder encodeObject:self.imageName forKey:@"imageName"];
    [encoder encodeObject:self.allValues forKey:@"allValues"];
    [encoder encodeObject:self.allKeys forKey:@"allKeys"];
   
    
    
    
}



- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
        self.titleOther = [decoder decodeObjectForKey:@"titleOther"];
        self.imageName = [decoder decodeObjectForKey:@"imageName"];
        self.allValues = [decoder decodeObjectForKey:@"allValues"];
        self.allKeys = [decoder decodeObjectForKey:@"allKeys"];
        
    }
    return self;
}

@end
