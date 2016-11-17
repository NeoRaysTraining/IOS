//
//  DropBox.m
//  AllMyPasswords
//
//  Created by test on 16/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "DropBox.h"
#import <ObjectiveDropboxOfficial/ObjectiveDropboxOfficial.h>
#import "ModalClass.h"
@interface DropBox ()

@end

@implementation DropBox{

     DropboxClient *client;
    NSMutableArray *shortResults;
    NSMutableArray *backupResults;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.switchDrop.isOn) {
        return 3;
    }
    else{
        return 1;
    }
}


- (IBAction)dropBoxSwitch:(id)sender {
    
    if (self.switchDrop.isOn) {
        [self logIn];
    }
    [self.tableView reloadData];
}

- (IBAction)backupToDroBox:(id)sender {
    
    [self fetchData];
    client = [DropboxClientsManager authorizedClient];
    

    
   
    
    NSData *mydata = [NSKeyedArchiver archivedDataWithRootObject:shortResults];
    
    
    
    
    
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

- (IBAction)restoreFromDropBox:(id)sender {
    
    [self deleteDB];
    
    
    client = [DropboxClientsManager authorizedClient];
    
    
    
    // Download to NSData
    [[[client.filesRoutes downloadData:@"/backup/app/allmypasswords.backup"]
      response:^(DBFILESFileMetadata *result, DBFILESDownloadError *routeError, DBError *error, NSData *fileContents) {
          if (result) {
              NSLog(@"Downloaded Details : %@\n", result);
              NSLog(@"%@ [NSKeyedUnarchiver unarchiveObjectWithData:fileContents] ",fileContents);
             
             
              
 
              backupResults = [NSKeyedUnarchiver unarchiveObjectWithData:fileContents];
              
              NSLog(@"Downloaded Result : %@\n", backupResults);
              
              [self updateDB:backupResults];
          } else {
              NSLog(@"%@\n%@\n", routeError, error);
          }
      }] progress:^(int64_t bytesDownloaded, int64_t totalBytesDownloaded, int64_t totalBytesExpectedToDownload) {
          NSLog(@"%lld\n%lld\n%lld\n", bytesDownloaded, totalBytesDownloaded, totalBytesExpectedToDownload);
      }];
    
    
    
}

-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"AllPasswords"];
    NSError* error=nil;
    
  NSArray* results=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
  
    shortResults = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<results.count; i++) {
        [shortResults addObject:[[ModalClass alloc] initiWithTitle:[[results objectAtIndex:i] valueForKey:@"title"] :[[results objectAtIndex:i] valueForKey:@"userName"] :[[results objectAtIndex:i] valueForKey:@"password"] :[[results objectAtIndex:i] valueForKey:@"notes"] :[[results objectAtIndex:i] valueForKey:@"picture"]]];
    }
    //shortResults = [[NSMutableArray alloc]initWithObjects:shortRes,nil];
    NSLog(@"FetchResults shortResults : %@",shortResults);
   // [self.myTableView reloadData];
    
}


-(NSManagedObjectContext *)getContext{
    
        AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
        
        NSManagedObjectContext *context = [App persistentContainer].viewContext;
        
        return context;
        
    }
-(void)deleteDB{

    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"AllPasswords"];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    
    
    
    if (objects == nil) {
        NSLog(@"There is no objetcs");
    } else {
        for (NSManagedObject *object in objects) {
            [context deleteObject:object];
        }
        [context save:&error];
        
    }
}

-(void)updateDB : (NSMutableArray*)objects{
    
    NSManagedObjectContext *context = [self getContext];
   // NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"AllPasswords"];
    
    //NSError *error;
    //NSArray *objects = [context executeFetchRequest:request error:&error];
    
    for (ModalClass *performerDic in objects) {
        
        NSManagedObject *artistsObjectFromDB = [NSEntityDescription insertNewObjectForEntityForName:@"AllPasswords" inManagedObjectContext:context];
        
     
            [artistsObjectFromDB setValue:performerDic.title forKey:@"title"];
        [artistsObjectFromDB setValue:performerDic.userName forKey:@"userName"];
        [artistsObjectFromDB setValue:performerDic.password forKey:@"password"];
        [artistsObjectFromDB setValue:performerDic.notes forKey:@"notes"];
        [artistsObjectFromDB setValue:performerDic.picture forKey:@"picture"];
        
       
        
        if (![context save:nil]) {
            NSLog(@"Not Saved");
        }
        else{
            NSLog(@"Data Saved Successfully");
            
        }
        

   
    }
    
}

- (void)logIn {
    [DropboxClientsManager authorizeFromController:[UIApplication sharedApplication]
                                        controller:self
                                           openURL:^(NSURL *url) {
                                               
                                               
                                               
                                               
                                               
                                               UIApplication *application = [UIApplication sharedApplication];
                                               [application openURL:url options:@{} completionHandler:nil];
                                               
                                           }
                                       browserAuth:YES];
    
}
@end
