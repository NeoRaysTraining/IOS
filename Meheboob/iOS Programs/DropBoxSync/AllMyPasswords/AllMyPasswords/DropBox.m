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

    UIView *activityView;
    UIProgressView *progressView;
    UIActivityIndicatorView *indicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"dropSwitch"] isEqualToString:@"1"]) {
        
        self.switchDrop.on = YES;
    }
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"dropSwitch"] isEqualToString:@"0"]) {
        
        self.switchDrop.on = NO;
    }
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
        NSString *valueToSave = @"1";
        [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"dropSwitch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self logIn];
    }
    if (!self.switchDrop.isOn) {
        NSString *valueToSave = @"0";
        [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"dropSwitch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    [self.tableView reloadData];
}

- (IBAction)backupToDroBox:(id)sender {

    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Backup to Dropbox" message:@"The backup file on Dropbox will be replaced by the current data in App!" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
       
        
    }]];
    
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Backup to Dropbox" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        [self createActivity];

        [self backUpMethod];
        
        
    }]];
    [self presentViewController:actionSheet animated:YES completion:nil];

    
   
}

- (IBAction)restoreFromDropBox:(id)sender {
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Restore from Dropbox" message:@"All data in app will be replaced by the data on Dropbox" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        
        
    }]];
    
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Restore from Dropbox" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        
        [self restoreMethod];
        
        
    }]];
    [self presentViewController:actionSheet animated:YES completion:nil];
    

    
    
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
    [self deleteDB];
    NSManagedObjectContext *context = [self getContext];
  
    
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
    [self hideActivityView];
    [self desplayAlert:@"Success" :@"App is updated with Dropbox backup"];
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











-(void)backUpMethod{

  
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
              
              [self hideActivityView];
              
              [self desplayAlert:@"Success" :@"App backup is created in Dropbox backup"];
             
              
          } else {
              NSLog(@"%@\n%@\n", routeError, error);
             
          }
      }] progress:^(int64_t bytesUploaded, int64_t totalBytesUploaded, int64_t totalBytesExpectedToUploaded) {
          NSLog(@"\n%lld\n%lld\n%lld\n", bytesUploaded, totalBytesUploaded, totalBytesExpectedToUploaded);
   
          float progress = (double)totalBytesUploaded/(double)totalBytesExpectedToUploaded;
          [progressView setProgress:progress];
          
      }];
    
    
}

-(void)restoreMethod{
    
    [self createActivity];
    
    
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
    //          [self hideActivityView];

          } else {
              NSLog(@"%@\n%@\n", routeError, error);
             // [self hideActivityView];
             
              

          }
      }] progress:^(int64_t bytesDownloaded, int64_t totalBytesDownloaded, int64_t totalBytesExpectedToDownload) {
          NSLog(@"%lld\n%lld\n%lld\n", bytesDownloaded, totalBytesDownloaded, totalBytesExpectedToDownload
                );
          float progress = (double)totalBytesDownloaded/(double)totalBytesExpectedToDownload;
          [progressView setProgress:progress];
      }];
    
    

    
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    activityView.center = self.tableView.center;
}

-(void)createActivity{
    [self showActivityView];
    
    //Create and add the Activity Indicator to splashView
  indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.alpha = 1.0;
    indicator.center = CGPointMake(75, 30);
    //indicator.hidesWhenStopped = NO;
    [activityView addSubview:indicator];
    [indicator startAnimating];
    
    activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    activityView.layer.cornerRadius = 8.0;
    
    activityView.backgroundColor = [UIColor grayColor];
    progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 135, 132, 2)];
    [activityView addSubview:indicator];
    [activityView addSubview:progressView];
    [self.navigationController.view addSubview:activityView];
    //[self.view addSubview:activityView];
    [self.tableView bringSubviewToFront:activityView];
    [self.tableView reloadData];


    
}


-(void)hideActivityView{

    [activityView removeFromSuperview];
    activityView.hidden = YES;
    progressView.hidden = YES;
    indicator.hidden = YES;
    [self.tableView reloadData];
}
-(void)showActivityView{
    
    activityView.hidden = NO;
    progressView.hidden = NO;
    indicator.hidden = NO;
    [self.tableView reloadData];

}

-(void)desplayAlert : (NSString *)title : (NSString*)message{


    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}


@end
