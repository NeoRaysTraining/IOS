//
//  ViewController.m
//  myAppCloudDemo
//
//  Created by Mahaboobsab Nadaf on 14/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import <ObjectiveDropboxOfficial/ObjectiveDropboxOfficial.h>

@interface ViewController ()
@end

@implementation ViewController{

    NSMutableArray *imageArray;
    DropboxClient *client;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  imageArray = [[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"Edit Sucsees",@"Edit Sucsees Meheboob",@"Nadaf",@"2",@"3",@"You are great",@"Check Login", nil];
    
   }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)myButtonInControllerPressed {
    [DropboxClientsManager authorizeFromController:[UIApplication sharedApplication]
                                        controller:self
                                           openURL:^(NSURL *url) {
                                               
                                               
                                             
                                               
                                               
                                               UIApplication *application = [UIApplication sharedApplication];
                                               [application openURL:url options:@{} completionHandler:nil];
                                               
                                           }
                                       browserAuth:YES];
    
}
- (IBAction)logIn:(id)sender {
    
    [self myButtonInControllerPressed];
}




- (IBAction)restore:(id)sender {
    
    // Download to NSData
    [[[client.filesRoutes downloadData:@"/backup/app/allmypasswords.backup"]
      response:^(DBFILESFileMetadata *result, DBFILESDownloadError *routeError, DBError *error, NSData *fileContents) {
          if (result) {
              NSLog(@"Downloaded Details : %@\n", result);
              // NSString *dataStr = [[NSString alloc]initWithData:fileContents encoding:NSUTF8StringEncoding];
              
              NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:fileContents];
              NSLog(@"Downloaded Result : %@\n", array);
          } else {
              NSLog(@"%@\n%@\n", routeError, error);
          }
      }] progress:^(int64_t bytesDownloaded, int64_t totalBytesDownloaded, int64_t totalBytesExpectedToDownload) {
          NSLog(@"%lld\n%lld\n%lld\n", bytesDownloaded, totalBytesDownloaded, totalBytesExpectedToDownload);
      }];
    

}

- (IBAction)backUp:(id)sender {
    
    
    client = [DropboxClientsManager authorizedClient];
    
    
    
                NSData *mydata = [NSKeyedArchiver archivedDataWithRootObject:imageArray];
    
    
    
    
    
                [[client.filesRoutes delete_:@"/backup/app/allmypasswords.backup"]
                 response:^(DBFILESMetadata *result, DBFILESDeleteError *routeError, DBError *error) {
                     if (result) {
                         if ([result isKindOfClass:[DBFILESFileMetadata class]]) {
                             DBFILESFileMetadata *fileMetadata = (DBFILESFileMetadata *)result;
                             NSLog(@"%@\n", fileMetadata);
                         } else if ([result isKindOfClass:[DBFILESFolderMetadata class]]) {
                             DBFILESFolderMetadata *folderMetadata = (DBFILESFolderMetadata *)result;
                             NSLog(@"%@\n", folderMetadata);
                         } else if ([result isKindOfClass:[DBFILESDeletedMetadata class]]) {
                             DBFILESDeletedMetadata *deletedMetadata = (DBFILESDeletedMetadata *)result;
                             NSLog(@"%@\n", deletedMetadata);
                         }
                     } else {
                         if (routeError) {
                             // see handling above
                         } else {
                             // see handling above
                         }
                     }
                 }];
    
    
    
    
    
    
    
                [[client.filesRoutes createFolder:@"/backup/app"]
                 response:^(DBFILESFolderMetadata *result, DBFILESCreateFolderError *routeError, DBError *error) {
                     if (result) {
                         NSLog(@"%@\n", result);
                     } else {
                         NSLog(@"%@\n%@\n", routeError, error);
                     }
                 }];
    
              //  NSData *fileData = [@"file data example Meheboob Raghu is added update.." dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    
    
                [[[client.filesRoutes uploadData:@"/backup/app/allmypasswords.backup" inputData:mydata]
                  response:^(DBFILESFileMetadata *result, DBFILESUploadError *routeError, DBError *error) {
                      if (result) {
                          NSLog(@" Downloaded Result : %@\n", result);
                      } else {
                          NSLog(@"%@\n%@\n", routeError, error);
                      }
                  }] progress:^(int64_t bytesUploaded, int64_t totalBytesUploaded, int64_t totalBytesExpectedToUploaded) {
                      NSLog(@"\n%lld\n%lld\n%lld\n", bytesUploaded, totalBytesUploaded, totalBytesExpectedToUploaded);
                  }];
                

    
    
    
    }
@end
