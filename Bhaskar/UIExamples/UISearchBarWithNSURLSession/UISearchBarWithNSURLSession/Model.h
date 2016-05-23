//
//  Model.h
//  UISearchBarWithNSURLSession
//
//  Created by test on 5/23/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject


@property (nonatomic,strong) NSString *aName,*tName;

- (instancetype)initWithArtistName:(NSString*) artistName trackName:(NSString*) trackName;
@end
