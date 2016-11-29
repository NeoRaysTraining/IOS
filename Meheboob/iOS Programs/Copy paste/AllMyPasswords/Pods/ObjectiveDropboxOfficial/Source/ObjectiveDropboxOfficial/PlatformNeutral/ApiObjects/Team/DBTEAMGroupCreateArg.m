///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"
#import "DBTEAMCOMMONGroupManagementType.h"
#import "DBTEAMGroupCreateArg.h"

#pragma mark - API Object

@implementation DBTEAMGroupCreateArg

#pragma mark - Constructors

- (instancetype)initWithGroupName:(NSString *)groupName
                  groupExternalId:(NSString *)groupExternalId
              groupManagementType:(DBTEAMCOMMONGroupManagementType *)groupManagementType {

  self = [super init];
  if (self) {
    _groupName = groupName;
    _groupExternalId = groupExternalId;
    _groupManagementType = groupManagementType;
  }
  return self;
}

- (instancetype)initWithGroupName:(NSString *)groupName {
  return [self initWithGroupName:groupName groupExternalId:nil groupManagementType:nil];
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBTEAMGroupCreateArgSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBTEAMGroupCreateArgSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBTEAMGroupCreateArgSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBTEAMGroupCreateArgSerializer

+ (NSDictionary *)serialize:(DBTEAMGroupCreateArg *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"group_name"] = valueObj.groupName;
  if (valueObj.groupExternalId) {
    jsonDict[@"group_external_id"] = valueObj.groupExternalId;
  }
  if (valueObj.groupManagementType) {
    jsonDict[@"group_management_type"] =
        [DBTEAMCOMMONGroupManagementTypeSerializer serialize:valueObj.groupManagementType];
  }

  return jsonDict;
}

+ (DBTEAMGroupCreateArg *)deserialize:(NSDictionary *)valueDict {
  NSString *groupName = valueDict[@"group_name"];
  NSString *groupExternalId = valueDict[@"group_external_id"] ?: nil;
  DBTEAMCOMMONGroupManagementType *groupManagementType =
      valueDict[@"group_management_type"]
          ? [DBTEAMCOMMONGroupManagementTypeSerializer deserialize:valueDict[@"group_management_type"]]
          : nil;

  return [[DBTEAMGroupCreateArg alloc] initWithGroupName:groupName
                                         groupExternalId:groupExternalId
                                     groupManagementType:groupManagementType];
}

@end
