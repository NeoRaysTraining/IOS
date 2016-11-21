///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBSHARINGFolderAction.h"
#import "DBSHARINGGetMetadataArgs.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBSHARINGGetMetadataArgs

#pragma mark - Constructors

- (instancetype)initWithSharedFolderId:(NSString *)sharedFolderId actions:(NSArray<DBSHARINGFolderAction *> *)actions {
  [DBStoneValidators stringValidator:nil maxLength:nil pattern:@"[-_0-9a-zA-Z:]+"](sharedFolderId);
  [DBStoneValidators nullableValidator:[DBStoneValidators arrayValidator:nil maxItems:nil itemValidator:nil]](actions);

  self = [super init];
  if (self) {
    _sharedFolderId = sharedFolderId;
    _actions = actions;
  }
  return self;
}

- (instancetype)initWithSharedFolderId:(NSString *)sharedFolderId {
  return [self initWithSharedFolderId:sharedFolderId actions:nil];
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBSHARINGGetMetadataArgsSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBSHARINGGetMetadataArgsSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBSHARINGGetMetadataArgsSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBSHARINGGetMetadataArgsSerializer

+ (NSDictionary *)serialize:(DBSHARINGGetMetadataArgs *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"shared_folder_id"] = valueObj.sharedFolderId;
  if (valueObj.actions) {
    jsonDict[@"actions"] = [DBArraySerializer serialize:valueObj.actions
                                              withBlock:^id(id elem) {
                                                return [DBSHARINGFolderActionSerializer serialize:elem];
                                              }];
  }

  return jsonDict;
}

+ (DBSHARINGGetMetadataArgs *)deserialize:(NSDictionary *)valueDict {
  NSString *sharedFolderId = valueDict[@"shared_folder_id"];
  NSArray<DBSHARINGFolderAction *> *actions =
      valueDict[@"actions"] ? [DBArraySerializer deserialize:valueDict[@"actions"]
                                                   withBlock:^id(id elem) {
                                                     return [DBSHARINGFolderActionSerializer deserialize:elem];
                                                   }]
                            : nil;

  return [[DBSHARINGGetMetadataArgs alloc] initWithSharedFolderId:sharedFolderId actions:actions];
}

@end
