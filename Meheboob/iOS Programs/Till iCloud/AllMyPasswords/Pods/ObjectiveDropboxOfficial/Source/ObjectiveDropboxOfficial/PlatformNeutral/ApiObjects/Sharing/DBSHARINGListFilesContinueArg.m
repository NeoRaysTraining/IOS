///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBSHARINGListFilesContinueArg.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBSHARINGListFilesContinueArg

#pragma mark - Constructors

- (instancetype)initWithCursor:(NSString *)cursor {

  self = [super init];
  if (self) {
    _cursor = cursor;
  }
  return self;
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBSHARINGListFilesContinueArgSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBSHARINGListFilesContinueArgSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBSHARINGListFilesContinueArgSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBSHARINGListFilesContinueArgSerializer

+ (NSDictionary *)serialize:(DBSHARINGListFilesContinueArg *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"cursor"] = valueObj.cursor;

  return jsonDict;
}

+ (DBSHARINGListFilesContinueArg *)deserialize:(NSDictionary *)valueDict {
  NSString *cursor = valueDict[@"cursor"];

  return [[DBSHARINGListFilesContinueArg alloc] initWithCursor:cursor];
}

@end
