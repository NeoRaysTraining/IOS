///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBSHARINGRequestedVisibility;
@class DBSHARINGSharedLinkSettings;

#pragma mark - API Object

///
/// The `SharedLinkSettings` struct.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBSHARINGSharedLinkSettings : NSObject <DBSerializable>

#pragma mark - Instance fields

/// The requested access for this shared link.
@property (nonatomic, readonly) DBSHARINGRequestedVisibility * _Nullable requestedVisibility;

/// If requestedVisibility is `password` in `DBSHARINGRequestedVisibility` this
/// is needed to specify the password to access the link.
@property (nonatomic, readonly) NSString * _Nullable linkPassword;

/// Expiration time of the shared link. By default the link won't expire.
@property (nonatomic, readonly) NSDate * _Nullable expires;

#pragma mark - Constructors

///
/// Full constructor for the struct (exposes all instance variables).
///
/// @param requestedVisibility The requested access for this shared link.
/// @param linkPassword If requestedVisibility is `password` in
/// `DBSHARINGRequestedVisibility` this is needed to specify the password to
/// access the link.
/// @param expires Expiration time of the shared link. By default the link won't
/// expire.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithRequestedVisibility:(DBSHARINGRequestedVisibility * _Nullable)requestedVisibility
                                       linkPassword:(NSString * _Nullable)linkPassword
                                            expires:(NSDate * _Nullable)expires;

///
/// Convenience constructor (exposes only non-nullable instance variables with
/// no default value).
///
///
/// @return An initialized instance.
///
- (nonnull instancetype)init;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `SharedLinkSettings` struct.
///
@interface DBSHARINGSharedLinkSettingsSerializer : NSObject

///
/// Serializes `DBSHARINGSharedLinkSettings` instances.
///
/// @param instance An instance of the `DBSHARINGSharedLinkSettings` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBSHARINGSharedLinkSettings` API object.
///
+ (NSDictionary * _Nonnull)serialize:(DBSHARINGSharedLinkSettings * _Nonnull)instance;

///
/// Deserializes `DBSHARINGSharedLinkSettings` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBSHARINGSharedLinkSettings` API object.
///
/// @return An instantiation of the `DBSHARINGSharedLinkSettings` object.
///
+ (DBSHARINGSharedLinkSettings * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end
