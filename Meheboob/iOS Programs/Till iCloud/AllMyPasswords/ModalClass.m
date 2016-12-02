//
//  ModalClass.m
//  AllMyPasswords
//
//  Created by test on 17/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ModalClass.h"

@implementation ModalClass


-(instancetype)initiWithTitle:(NSString *)title :(NSString *)username :(NSString *)password :(NSString *)notes :(NSString *)picture{
   
    self.title = title;
    self.userName = username;
    self.password = password;
    self.notes = notes;
    self.picture = picture;
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.userName forKey:@"userName"];
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.notes forKey:@"notes"];
    [encoder encodeObject:self.picture forKey:@"picture"];
    
    
    
}



- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        
        self.title = [decoder decodeObjectForKey:@"title"];
        self.userName = [decoder decodeObjectForKey:@"userName"];
        self.password = [decoder decodeObjectForKey:@"password"];
        self.notes = [decoder decodeObjectForKey:@"notes"];
        self.picture=[decoder decodeObjectForKey:@"picture"];
        
    }
    return self;
}

@end
