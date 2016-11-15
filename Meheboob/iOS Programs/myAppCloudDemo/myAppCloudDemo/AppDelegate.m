//
//  AppDelegate.m
//  myAppCloudDemo
//
//  Created by Mahaboobsab Nadaf on 14/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()
@property(nonatomic)DBOAuthResult *authResult;
@end


@implementation AppDelegate{

    NSMutableArray *imageArray;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    imageArray = [[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"Edit Sucsees",@"Edit Sucsees Meheboob",@"Nadaf",@"2",@"3",@"Well Done", nil];
    
    
    // Override point for customization after application launch.
    [DropboxClientsManager setupWithAppKey:@"kxplkods0i0dqb0"];
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    self.authResult = [DropboxClientsManager handleRedirectURL:url];
    if (self.authResult != nil) {
        if ([self.authResult isSuccess]) {
            NSLog(@"Success! User is logged into Dropbox.");
            
            
//            [imageArray addObject:@"Object added"];
  //          DropboxClient *client = [DropboxClientsManager authorizedClient];
//            
//            
//           
//            NSData *mydata = [NSKeyedArchiver archivedDataWithRootObject:imageArray];
//            
//            
//            
//            
//            
//            [[client.filesRoutes delete_:@"/backup/app/allmypasswords.backup"]
//             response:^(DBFILESMetadata *result, DBFILESDeleteError *routeError, DBError *error) {
//                 if (result) {
//                     if ([result isKindOfClass:[DBFILESFileMetadata class]]) {
//                         DBFILESFileMetadata *fileMetadata = (DBFILESFileMetadata *)result;
//                         NSLog(@"%@\n", fileMetadata);
//                     } else if ([result isKindOfClass:[DBFILESFolderMetadata class]]) {
//                         DBFILESFolderMetadata *folderMetadata = (DBFILESFolderMetadata *)result;
//                         NSLog(@"%@\n", folderMetadata);
//                     } else if ([result isKindOfClass:[DBFILESDeletedMetadata class]]) {
//                         DBFILESDeletedMetadata *deletedMetadata = (DBFILESDeletedMetadata *)result;
//                         NSLog(@"%@\n", deletedMetadata);
//                     }
//                 } else {
//                     if (routeError) {
//                         // see handling above
//                     } else {
//                         // see handling above
//                     }
//                 }
//             }];
//            
//            
//        
//            
//            
//            
//            
//            [[client.filesRoutes createFolder:@"/backup/app"]
//             response:^(DBFILESFolderMetadata *result, DBFILESCreateFolderError *routeError, DBError *error) {
//                 if (result) {
//                     NSLog(@"%@\n", result);
//                 } else {
//                     NSLog(@"%@\n%@\n", routeError, error);
//                 }
//             }];
//            
//          //  NSData *fileData = [@"file data example Meheboob Raghu is added update.." dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
//            
//            
//            [[[client.filesRoutes uploadData:@"/backup/app/allmypasswords.backup" inputData:mydata]
//              response:^(DBFILESFileMetadata *result, DBFILESUploadError *routeError, DBError *error) {
//                  if (result) {
//                      NSLog(@" Downloaded Result : %@\n", result);
//                  } else {
//                      NSLog(@"%@\n%@\n", routeError, error);
//                  }
//              }] progress:^(int64_t bytesUploaded, int64_t totalBytesUploaded, int64_t totalBytesExpectedToUploaded) {
//                  NSLog(@"\n%lld\n%lld\n%lld\n", bytesUploaded, totalBytesUploaded, totalBytesExpectedToUploaded);
//              }];
//            
//            
//            
            
//            // Download to NSData
//            [[[client.filesRoutes downloadData:@"/backup/app/allmypasswords.backup"]
//              response:^(DBFILESFileMetadata *result, DBFILESDownloadError *routeError, DBError *error, NSData *fileContents) {
//                  if (result) {
//                      NSLog(@"Downloaded Details : %@\n", result);
//                     // NSString *dataStr = [[NSString alloc]initWithData:fileContents encoding:NSUTF8StringEncoding];
//                      
//                      NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:fileContents];
//                      NSLog(@"Downloaded Result : %@\n", array);
//                  } else {
//                      NSLog(@"%@\n%@\n", routeError, error);
//                  }
//              }] progress:^(int64_t bytesDownloaded, int64_t totalBytesDownloaded, int64_t totalBytesExpectedToDownload) {
//                  NSLog(@"%lld\n%lld\n%lld\n", bytesDownloaded, totalBytesDownloaded, totalBytesExpectedToDownload);
//              }];
//            
            
            
            
            
            
            
            
        } else if ([_authResult isCancel]) {
            NSLog(@"Authorization flow was manually canceled by user!");
        } else if ([_authResult isError]) {
            NSLog(@"Error: %@", _authResult);
        }
    }
    
   
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
