//
//  ViewController.m
//  DownloadUsingCoreData
//
//  Created by Mahaboobsab Nadaf on 17/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Initializing and allocating memory to the variables
    self.urlString = [[NSString alloc]init];
    self.json = [[NSDictionary alloc]init];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dowload:(id)sender {
    
    //Initializing string with URL
    self.urlString = @"http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo";
    
    
    
    
    
    NSManagedObjectContext *context = [self getContext];
    
    
    
    
   
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"JsonData"];
    
    NSError *error = nil;
    
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(jsonFile = %@)",
                         self.urlString];
    [fetchRequest setPredicate:pred];
    
    //used to delete object from CoreData
  //  NSManagedObject *matches = nil;
    
    
    
    
    NSArray *objects = [context executeFetchRequest:fetchRequest error:&error];
    
    //used to delete object from CoreData
    //matches = [objects objectAtIndex:0];
  
   
    //used to delete object from CoreData
   // [context deleteObject:matches];
    
    //used to delete object from CoreData
    //[context save:nil];
    
    if ([objects count] >= 1) {
        
        
        //Display AlertView
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"JSON is allready Existing"
                                              message:@""
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  
                                                                  
                                                                  
                                                                  
                                                              }];
        
        
        [alertController addAction:defaultAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        
        NSLog(@"Allready object is there");
        
    } else {
      
        
    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:self.urlString]completionHandler:^(NSData * data, NSURLResponse *  response, NSError *  error) {
        self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSLog(@"json is : %@",self.json);
        
       
        
        
        
        
    
    }];
    
    
    NSManagedObjectContext *context2 = [self getContext];
    
    NSManagedObject *urlNames = [NSEntityDescription insertNewObjectForEntityForName:@"JsonData" inManagedObjectContext:context2];
        
    [urlNames setValue:self.urlString forKey:@"jsonFile"];
    
    NSError *error2 = nil;
    if (![context save:&error2]) {
        NSLog(@"Failed to Save Data");
    }
    
    else{
        
        
        NSLog(@"Data Saved Successfully");
        
    }

    [dataTask resume];

}
 }

//Creating Context
-(NSManagedObjectContext *)getContext{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    return context;
}
@end
