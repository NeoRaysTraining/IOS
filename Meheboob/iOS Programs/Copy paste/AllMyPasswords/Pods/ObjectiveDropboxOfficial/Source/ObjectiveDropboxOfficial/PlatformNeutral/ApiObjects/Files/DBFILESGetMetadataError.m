///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBFILESGetMetadataError.h"
#import "DBFILESLookupError.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBFILESGetMetadataError

@synthesize path = _path;

#pragma mark - Constructors

- (instancetype)initWithPath:(DBFILESLookupError *)path {
  self = [super init];
  if (self) {
    _tag = DBFILESGetMetadataErrorPath;
    _path = path;
  }
  return self;
}

#pragma mark - Instance field accessors

- (DBFILESLookupError *)path {
  if (![self isPath]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBFILESGetMetadataErrorPath, but was %@.", [self tagName]];
  }
  return _path;
}

#pragma mark - Tag state methods

- (BOOL)isPath {
  return _tag == DBFILESGetMetadataErrorPath;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBFILESGetMetadataErrorPath:
    return @"DBFILESGetMetadataErrorPath";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBFILESGetMetadataErrorSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBFILESGetMetadataErrorSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBFILESGetMetadataErrorSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBFILESGetMetadataErrorSerializer

+ (NSDictionary *)serialize:(DBFILESGetMetadataError *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isPath]) {
    jsonDict[@"path"] = [[DBFILESLookupErrorSerializer serialize:valueObj.path] mutableCopy];
    jsonDict[@".tag"] = @"path";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBFILESGetMetadataError *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"path"]) {
    DBFILESLookupError *path = [DBFILESLookupErrorSerializer deserialize:valueDict[@"path"]];
    return [[DBFILESGetMetadataError alloc] initWithPath:path];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
