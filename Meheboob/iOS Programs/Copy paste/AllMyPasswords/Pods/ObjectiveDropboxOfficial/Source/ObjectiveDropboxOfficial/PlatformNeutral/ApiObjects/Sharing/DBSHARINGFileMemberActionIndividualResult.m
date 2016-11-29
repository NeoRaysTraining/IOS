///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBSHARINGAccessLevel.h"
#import "DBSHARINGFileMemberActionError.h"
#import "DBSHARINGFileMemberActionIndividualResult.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBSHARINGFileMemberActionIndividualResult

@synthesize success = _success;
@synthesize memberError = _memberError;

#pragma mark - Constructors

- (instancetype)initWithSuccess:(DBSHARINGAccessLevel *)success {
  self = [super init];
  if (self) {
    _tag = DBSHARINGFileMemberActionIndividualResultSuccess;
    _success = success;
  }
  return self;
}

- (instancetype)initWithMemberError:(DBSHARINGFileMemberActionError *)memberError {
  self = [super init];
  if (self) {
    _tag = DBSHARINGFileMemberActionIndividualResultMemberError;
    _memberError = memberError;
  }
  return self;
}

#pragma mark - Instance field accessors

- (DBSHARINGAccessLevel *)success {
  if (![self isSuccess]) {
    [NSException
         raise:@"IllegalStateException"
        format:@"Invalid tag: required DBSHARINGFileMemberActionIndividualResultSuccess, but was %@.", [self tagName]];
  }
  return _success;
}

- (DBSHARINGFileMemberActionError *)memberError {
  if (![self isMemberError]) {
    [NSException raise:@"IllegalStateException"
                format:@"Invalid tag: required DBSHARINGFileMemberActionIndividualResultMemberError, but was %@.",
                       [self tagName]];
  }
  return _memberError;
}

#pragma mark - Tag state methods

- (BOOL)isSuccess {
  return _tag == DBSHARINGFileMemberActionIndividualResultSuccess;
}

- (BOOL)isMemberError {
  return _tag == DBSHARINGFileMemberActionIndividualResultMemberError;
}

- (NSString *)tagName {
  switch (_tag) {
  case DBSHARINGFileMemberActionIndividualResultSuccess:
    return @"DBSHARINGFileMemberActionIndividualResultSuccess";
  case DBSHARINGFileMemberActionIndividualResultMemberError:
    return @"DBSHARINGFileMemberActionIndividualResultMemberError";
  }

  @throw([NSException exceptionWithName:@"InvalidTag" reason:@"Tag has an unknown value." userInfo:nil]);
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBSHARINGFileMemberActionIndividualResultSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBSHARINGFileMemberActionIndividualResultSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBSHARINGFileMemberActionIndividualResultSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBSHARINGFileMemberActionIndividualResultSerializer

+ (NSDictionary *)serialize:(DBSHARINGFileMemberActionIndividualResult *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if ([valueObj isSuccess]) {
    if (valueObj.success) {
      jsonDict = [[DBSHARINGAccessLevelSerializer serialize:valueObj.success] mutableCopy];
    }
    jsonDict[@".tag"] = @"success";
  } else if ([valueObj isMemberError]) {
    jsonDict[@"member_error"] = [[DBSHARINGFileMemberActionErrorSerializer serialize:valueObj.memberError] mutableCopy];
    jsonDict[@".tag"] = @"member_error";
  } else {
    @throw([NSException exceptionWithName:@"InvalidTag"
                                   reason:@"Object not properly initialized. Tag has an unknown value."
                                 userInfo:nil]);
  }

  return jsonDict;
}

+ (DBSHARINGFileMemberActionIndividualResult *)deserialize:(NSDictionary *)valueDict {
  NSString *tag = valueDict[@".tag"];

  if ([tag isEqualToString:@"success"]) {
    DBSHARINGAccessLevel *success =
        valueDict[@"success"] ? [DBSHARINGAccessLevelSerializer deserialize:valueDict[@"success"]] : nil;
    return [[DBSHARINGFileMemberActionIndividualResult alloc] initWithSuccess:success];
  } else if ([tag isEqualToString:@"member_error"]) {
    DBSHARINGFileMemberActionError *memberError =
        [DBSHARINGFileMemberActionErrorSerializer deserialize:valueDict[@"member_error"]];
    return [[DBSHARINGFileMemberActionIndividualResult alloc] initWithMemberError:memberError];
  }

  @throw([NSException
      exceptionWithName:@"InvalidTag"
                 reason:[NSString stringWithFormat:@"Tag has an invalid value: \"%@\".", valueDict[@".tag"]]
               userInfo:nil]);
}

@end
