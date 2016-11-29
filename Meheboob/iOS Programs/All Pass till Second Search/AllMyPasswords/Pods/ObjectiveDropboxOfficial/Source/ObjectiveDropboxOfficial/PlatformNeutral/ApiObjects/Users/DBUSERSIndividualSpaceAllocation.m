///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"
#import "DBUSERSIndividualSpaceAllocation.h"

#pragma mark - API Object

@implementation DBUSERSIndividualSpaceAllocation

#pragma mark - Constructors

- (instancetype)initWithAllocated:(NSNumber *)allocated {

  self = [super init];
  if (self) {
    _allocated = allocated;
  }
  return self;
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBUSERSIndividualSpaceAllocationSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBUSERSIndividualSpaceAllocationSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBUSERSIndividualSpaceAllocationSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBUSERSIndividualSpaceAllocationSerializer

+ (NSDictionary *)serialize:(DBUSERSIndividualSpaceAllocation *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"allocated"] = valueObj.allocated;

  return jsonDict;
}

+ (DBUSERSIndividualSpaceAllocation *)deserialize:(NSDictionary *)valueDict {
  NSNumber *allocated = valueDict[@"allocated"];

  return [[DBUSERSIndividualSpaceAllocation alloc] initWithAllocated:allocated];
}

@end
