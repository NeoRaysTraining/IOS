///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

@class DBTEAMRoutes;
@class DBTransportClient;

///
/// Base client object that contains an instance field for each namespace, each
/// of which contains references to all routes within that namespace.
/// Fully-implemented API clients will inherit this class.
///
@interface DBBaseTeam : NSObject

/// Routes within the `team` namespace.
@property (nonatomic, readonly) DBTEAMRoutes * _Nonnull teamRoutes;

/// Initializes the `DBBaseTeam` object with a networking client.
- (nonnull instancetype)initWithTransportClient:(DBTransportClient * _Nonnull)client;

@end
