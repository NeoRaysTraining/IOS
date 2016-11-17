///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBTEAMDeviceSessionArg;
@class DBTEAMRevokeDesktopClientArg;
@class DBTEAMRevokeDeviceSessionArg;

#pragma mark - API Object

///
/// The `RevokeDeviceSessionArg` union.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBTEAMRevokeDeviceSessionArg : NSObject <DBSerializable>

#pragma mark - Instance fields

/// The `DBTEAMRevokeDeviceSessionArgTag` enum type represents the possible tag
/// states with which the `DBTEAMRevokeDeviceSessionArg` union can exist.
typedef NS_ENUM(NSInteger, DBTEAMRevokeDeviceSessionArgTag) {
  /// End an active session
  DBTEAMRevokeDeviceSessionArgWebSession,

  /// Unlink a linked desktop device
  DBTEAMRevokeDeviceSessionArgDesktopClient,

  /// Unlink a linked mobile device
  DBTEAMRevokeDeviceSessionArgMobileClient,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBTEAMRevokeDeviceSessionArgTag tag;

/// End an active session @note Ensure the `isWebSession` method returns true
/// before accessing, otherwise a runtime exception will be raised.
@property (nonatomic, readonly) DBTEAMDeviceSessionArg * _Nonnull webSession;

/// Unlink a linked desktop device @note Ensure the `isDesktopClient` method
/// returns true before accessing, otherwise a runtime exception will be raised.
@property (nonatomic, readonly) DBTEAMRevokeDesktopClientArg * _Nonnull desktopClient;

/// Unlink a linked mobile device @note Ensure the `isMobileClient` method
/// returns true before accessing, otherwise a runtime exception will be raised.
@property (nonatomic, readonly) DBTEAMDeviceSessionArg * _Nonnull mobileClient;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "web_session".
///
/// Description of the "web_session" tag state: End an active session
///
/// @param webSession End an active session
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithWebSession:(DBTEAMDeviceSessionArg * _Nonnull)webSession;

///
/// Initializes union class with tag state of "desktop_client".
///
/// Description of the "desktop_client" tag state: Unlink a linked desktop
/// device
///
/// @param desktopClient Unlink a linked desktop device
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithDesktopClient:(DBTEAMRevokeDesktopClientArg * _Nonnull)desktopClient;

///
/// Initializes union class with tag state of "mobile_client".
///
/// Description of the "mobile_client" tag state: Unlink a linked mobile device
///
/// @param mobileClient Unlink a linked mobile device
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithMobileClient:(DBTEAMDeviceSessionArg * _Nonnull)mobileClient;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value "web_session".
///
/// @note Call this method and ensure it returns true before accessing the
/// `webSession` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "web_session".
///
- (BOOL)isWebSession;

///
/// Retrieves whether the union's current tag state has value "desktop_client".
///
/// @note Call this method and ensure it returns true before accessing the
/// `desktopClient` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "desktop_client".
///
- (BOOL)isDesktopClient;

///
/// Retrieves whether the union's current tag state has value "mobile_client".
///
/// @note Call this method and ensure it returns true before accessing the
/// `mobileClient` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "mobile_client".
///
- (BOOL)isMobileClient;

///
/// Retrieves string value of union's current tag state.
///
/// @return A human-readable string representing the union's current tag state.
///
- (NSString * _Nonnull)tagName;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DBTEAMRevokeDeviceSessionArg` union.
///
@interface DBTEAMRevokeDeviceSessionArgSerializer : NSObject

///
/// Serializes `DBTEAMRevokeDeviceSessionArg` instances.
///
/// @param instance An instance of the `DBTEAMRevokeDeviceSessionArg` API
/// object.
///
/// @return A json-compatible dictionary representation of the
/// `DBTEAMRevokeDeviceSessionArg` API object.
///
+ (NSDictionary * _Nonnull)serialize:(DBTEAMRevokeDeviceSessionArg * _Nonnull)instance;

///
/// Deserializes `DBTEAMRevokeDeviceSessionArg` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBTEAMRevokeDeviceSessionArg` API object.
///
/// @return An instantiation of the `DBTEAMRevokeDeviceSessionArg` object.
///
+ (DBTEAMRevokeDeviceSessionArg * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end
