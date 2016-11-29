///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMRevokeLinkedAppError;
@class DBTEAMRevokeLinkedAppStatus;

#pragma mark - API Object

///
/// The `RevokeLinkedAppStatus` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMRevokeLinkedAppStatus : NSObject <DBSerializable>

#pragma mark - Instance fields

/// Result of the revoking request
@property (nonatomic, readonly) NSNumber * _Nonnull success;

/// The error cause in case of a failure
@property (nonatomic, readonly) DBTEAMRevokeLinkedAppError * _Nullable errorType;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param success Result of the revoking request
/// @param errorType The error cause in case of a failure
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithSuccess:(NSNumber * _Nonnull)success
                              errorType:(DBTEAMRevokeLinkedAppError * _Nullable)errorType;

///
/// Convenience constructor (exposes only non-nullable instance variables with
/// no default value).
///
/// @param success Result of the revoking request
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithSuccess:(NSNumber * _Nonnull)success;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `RevokeLinkedAppStatus` struct.
///
@interface DBTEAMRevokeLinkedAppStatusSerializer : NSObject

///
/// Serializes `DBTEAMRevokeLinkedAppStatus` instances.
///
/// @param instance An instance of the `DBTEAMRevokeLinkedAppStatus` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMRevokeLinkedAppStatus` API object.
///
+ (NSDictionary * _Nonnull)serialize:(DBTEAMRevokeLinkedAppStatus * _Nonnull)instance;

///
/// Deserializes `DBTEAMRevokeLinkedAppStatus` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMRevokeLinkedAppStatus` API object.
///
/// @return An instantiation of the `DBTEAMRevokeLinkedAppStatus` object.
///
+ (DBTEAMRevokeLinkedAppStatus * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end
