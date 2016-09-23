//
//  DBManager.h
//  SQLite Database
//
//  Created by Mahaboobsab Nadaf on 22/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DBManager : NSObject
{
    NSString *databasePath;
}

+(DBManager *)getSharedInstance;

-(BOOL)createDB;

-(BOOL)saveData:(NSString *)registerNumber name:(NSString *)name department:(NSString *)department year:(NSString *)year;

-(NSArray *)findByRegisterNumber:(NSString *)registerNumber;

@end


