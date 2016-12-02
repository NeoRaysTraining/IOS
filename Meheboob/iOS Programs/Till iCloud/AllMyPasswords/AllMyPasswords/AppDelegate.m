//
//  AppDelegate.m
//  AllMyPasswords
//
//  Created by Mahaboobsab Nadaf on 14/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "AppDelegate.h"
#import "ModalClass.h"
#import "ModelClassForWallet.h"
@interface AppDelegate ()
@property(nonatomic)DBOAuthResult *authResult;


@end

@implementation AppDelegate{

    NSMutableArray *loginsArray;
    NSMutableArray *walletsArray;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     NSLog(@"HOME > %@", NSHomeDirectory());
    
    
    
     [DropboxClientsManager setupWithAppKey:@"pwqg077t0303t1z"];
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    {
        loginsArray = [[NSMutableArray alloc] init];
        walletsArray = [[NSMutableArray alloc] init];
        [self updateTemplates];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    
    
    return YES;
        
}
    
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    self.authResult = [DropboxClientsManager handleRedirectURL:url];
    if (self.authResult != nil) {
        if ([self.authResult isSuccess]) {
            NSLog(@"Success! User is logged into Dropbox.");
            
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"AllMyPasswords"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}


-(void)updateTemplates{
    
    
    [loginsArray addObject:[[ModalClass alloc] initiWithTitle:@"Facebook" :@"someone@noware.com" :@"facebookpassword" :@"My Facebook Notes" :@"0.jpg"]];
    
    [loginsArray addObject:[[ModalClass alloc] initiWithTitle:@"Twitter" :@"someone@noware.com" :@"twitterpassword" :@"My Twitter Notes" :@"5.jpg"]];
    
    [loginsArray addObject:[[ModalClass alloc] initiWithTitle:@"Linked In" :@"someone@noware.com" :@"linkedInpassword" :@"My LinkedIn Notes" :@"2.jpg"]];
    
    [loginsArray addObject:[[ModalClass alloc] initiWithTitle:@"Gamil" :@"someone@gmail.com" :@"gmailpassword" :@"My Gmail Notes" :@"9.jpg"]];
    
    [loginsArray addObject:[[ModalClass alloc] initiWithTitle:@"Yahoo" :@"someone@yahoo.com" :@"yahoopassword" :@"My Yahoo Notes" :@"1.jpg"]];
    
    
    
    //Wallets Initialization
    
    NSArray *bankDetailL = [[NSArray alloc] initWithObjects:@"Account Number",@"IFSC",@"PIN",@"Type",@"Bank Name",@"Adress",@"Landline",@"Notes", nil];
    
    NSArray *bankDetailR = [[NSArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"Bank Account" :@"101.jpg" :[[NSData alloc] initWithData:[NSKeyedArchiver archivedDataWithRootObject:bankDetailL]] :[[NSData alloc] initWithData:[NSKeyedArchiver archivedDataWithRootObject:bankDetailR]]]];
    
    NSArray *creditCardL = [[NSArray alloc] initWithObjects:@"Number",@"Type",@"Bank Name",@"Card Holder",@"CVC",@"PIN",@"Date Of Issue",@"Date Of Expiry",@"Adress",@"Telephone",@"Website",@"Notes", nil];
    
    NSArray *creditCardR = [[NSArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"Credit Card" :@"102.jpg" :[NSKeyedArchiver archivedDataWithRootObject:creditCardL] :[NSKeyedArchiver archivedDataWithRootObject:creditCardR]]];
    
    NSArray *drivingLicenseL = [[NSArray alloc] initWithObjects:@"DL No",@"NAME",@"Last Name",@"DOB",@"VALID TILL",@"Vehicle Type",@"Date Of Issue",@"Date Of Expiry",@"Adress",@"Notes", nil];
    
    NSArray *drivingLicenseR = [[NSArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@" Text",@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"Driving License" :@"100.jpg" :[NSKeyedArchiver archivedDataWithRootObject:drivingLicenseL] :[NSKeyedArchiver archivedDataWithRootObject:drivingLicenseR]]];
    
    NSMutableArray *passportL = [[NSMutableArray alloc] initWithObjects:@"Name",@"Last name",@"Number",@"Type",@"DOB",@"Date Of Issue",@"Date Of Expiry",@"Place of Issue",@"Place of Birth",@"Adress",@"Notes", nil];
    
    NSMutableArray *passportR = [[NSMutableArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@" Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"Pssport" :@"109.jpg" :[NSKeyedArchiver archivedDataWithRootObject:passportL] :[NSKeyedArchiver archivedDataWithRootObject:passportR]]];
    
    NSMutableArray *panL = [[NSMutableArray alloc] initWithObjects:@"Full Name",@"Last name",@"Number",@"DOB",@"Notes", nil];
    
    NSMutableArray *panR = [[NSMutableArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"PAN Card" :@"107.jpg" :[NSKeyedArchiver archivedDataWithRootObject:panL] :[NSKeyedArchiver archivedDataWithRootObject:panR]]];
    
    NSMutableArray *adharL = [[NSMutableArray alloc] initWithObjects:@"Full Name",@"Last name",@"Number",@"DOB",@"Adess",@"Notes", nil];
    
    NSMutableArray *adharR = [[NSMutableArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"Adhar Card" :@"106.jpg" :[NSKeyedArchiver archivedDataWithRootObject:adharL] :[NSKeyedArchiver archivedDataWithRootObject:adharR]]];
    
    NSMutableArray *idL = [[NSMutableArray alloc] initWithObjects:@"Name",@"Last name",@"Number",@"DOB",@"Place Of birth",@"Date Of Issue",@"Date Of Expiry",@"Notes", nil];
    
    NSMutableArray *idR = [[NSMutableArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"ID Card" :@"104.jpg" :[NSKeyedArchiver archivedDataWithRootObject:idL] :[NSKeyedArchiver archivedDataWithRootObject:idR]]];
    
    NSMutableArray *vehicleL = [[NSMutableArray alloc] initWithObjects:@"Vehicle Number",@"License Number",@"Owner",@"Purchase Date",@"Vehicle Type",@"Model",@"Expires",@"Insurance Company",@"Police #",@"Expires",@"Telephone",@"Notes", nil];
    
    NSMutableArray *vehicleR = [[NSMutableArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"Vehicle Info" :@"112.jpg" :[NSKeyedArchiver archivedDataWithRootObject:vehicleL] :[NSKeyedArchiver archivedDataWithRootObject:vehicleR]]];
    
    NSMutableArray *homeL = [[NSMutableArray alloc] initWithObjects:@"Name",@"Number",@"Owner",@"Adress",@"Telephone",@"Notes", nil];
    
    NSMutableArray *homeR = [[NSMutableArray alloc] initWithObjects:@"Text",@"Text",@"Text",@"Text",@"Text",@"Text", nil];
    
    [walletsArray addObject:[[ModelClassForWallet alloc] initiWithTitle:@"House Info" :@"141.jpg" :[NSKeyedArchiver archivedDataWithRootObject:homeL] :[NSKeyedArchiver archivedDataWithRootObject:homeR]]];
    
    [self updateDB:loginsArray :walletsArray];
    
}

-(void)updateDB : (NSMutableArray*)modalObject : (NSMutableArray*)modelWalletObject{
    
    NSManagedObjectContext *context = [self getContext];
    
    
    for (ModalClass *performerDic in modalObject) {
        
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
    
    
    
    
    
    for (ModelClassForWallet *performerDic in modelWalletObject) {
        
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
        
    }
    
    
    
    
    
}
-(NSManagedObjectContext *)getContext{
    
    AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App persistentContainer].viewContext;
    
    return context;
    
}
@end
