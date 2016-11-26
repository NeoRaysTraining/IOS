//
//  iTunesRestore.m
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 18/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "iTunesRestore.h"
#import "AppDelegate.h"
#import "ModalClass.h"
#import "ModelClassForWallet.h"

@interface iTunesRestore ()

@end

@implementation iTunesRestore{

    NSData *restoreData;
    NSDictionary*backupResults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hideActivityView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)restore:(id)sender {
   // NSFileManager *fileManager = [NSFileManager defaultManager];
    [self showActivityView];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"AllPasswords.backup"];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        restoreData = [[NSFileManager defaultManager] contentsAtPath:filePath];
        
        backupResults = [NSKeyedUnarchiver unarchiveObjectWithData:restoreData];
        
        [self updateDB:backupResults];
        
        NSLog(@" iTunes Restore Sucessfull ");
        [self desplayAlert:@"Success" :@"iTunes Restore is  Sucessfull"];
    }
        else
    {
        [self desplayAlert:@"Error" :@"Backup file note exists"];
    }
}

-(void)deleteDB{
    
    NSManagedObjectContext *context = [self getContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"AllPasswords"];
    
    NSFetchRequest *request2 = [NSFetchRequest fetchRequestWithEntityName:@"AllPasswordsDetail"];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    NSArray *objects2 = [context executeFetchRequest:request2 error:&error];
    
    
    
    
    if (objects == nil) {
        NSLog(@"There is no objetcs");
    } else {
        for (NSManagedObject *object in objects) {
            [context deleteObject:object];
        }
        [context save:&error];
        
    }
    
    if (objects2 == nil) {
        NSLog(@"There is no objetcs");
    } else {
        for (NSManagedObject *object in objects2) {
            [context deleteObject:object];
        }
        [context save:&error];
        
    }
}
-(NSManagedObjectContext *)getContext{
    
    AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App persistentContainer].viewContext;
    
    return context;
    
}

-(void)updateDB : (NSDictionary*)objects{
    [self deleteDB];

        
    NSManagedObjectContext *context = [self getContext];
    
    NSMutableArray *AllPasswords = [objects objectForKey:@"AllPasswords"];
    
    NSMutableArray *AllPasswordsDetail = [objects objectForKey:@"AllPasswordsDetail"];
    
    for (ModalClass *performerDic in AllPasswords) {
       
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
            NSLog(@"Data Saved Successfully All Passwords");
            
            
        }
        
    }
    
    
    
    
    int i = 0;
    for (ModelClassForWallet *performerDic in AllPasswordsDetail) {
         i++;
        NSManagedObject *artistsObjectFromDB = [NSEntityDescription insertNewObjectForEntityForName:@"AllPasswordsDetail" inManagedObjectContext:context];
        
        
        [artistsObjectFromDB setValue:performerDic.titleOther forKey:@"titleOther"];
        [artistsObjectFromDB setValue:performerDic.imageName forKey:@"imageName"];
        [artistsObjectFromDB setValue:performerDic.allKeys forKey:@"allKeys"];
        [artistsObjectFromDB setValue:performerDic.allValues forKey:@"allValues"];
        
        
        
        
        if (![context save:nil]) {
            NSLog(@"Not Saved");
        }
        else{
            NSLog(@"Data Saved Successfully All Passwords Others");
            
            
        }
        float progress = (float)i/(float)objects.count;
        [self.progress setProgress:progress];

    }

    [self hideActivityView];

}

-(void)hideActivityView{

 self.activityView.hidden = YES;
    [self.indicator stopAnimating];
}

-(void)showActivityView{

    self.activityView.hidden = NO;
    [self.indicator startAnimating];
}
-(void)desplayAlert : (NSString*)title : (NSString*)msg{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [self removeFile:@"AllPasswords.backup"];
                  
                                                              [self hideActivityView];
                                                              
                                                              
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    


    
}

- (void)removeFile:(NSString *)filename
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:filename];
    NSError *error;
    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
    if (success) {
        NSLog(@"Successfully removed passwords");
    }
    else
    {
        NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
    }
}
@end
