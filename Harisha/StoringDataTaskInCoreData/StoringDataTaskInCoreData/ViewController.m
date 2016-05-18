//
//  ViewController.m
//  StoringDataTaskInCoreData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Model.h"
#import <CoreData/CoreData.h>


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong,nonatomic)NSArray* jsonArray;
@property(strong,nonatomic)NSArray* json;
@property(strong,nonatomic)NSDictionary* jsonDict;
@property (weak, nonatomic) IBOutlet UITableView *tableDisplay;
@property(strong,nonatomic)NSString* track;
@property (strong,nonatomic)NSMutableArray* coreObj;
@property(strong,nonatomic)NSString* nme;
@property(strong,nonatomic)NSString* tra;
@property(strong,nonatomic)NSMutableArray* employeeIDs;
@property(strong,nonatomic)NSMutableArray* allnames;

- (IBAction)download:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   [self fetchData];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.coreObj.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSManagedObject* obj = self.coreObj[indexPath.row];
    
    cell.textLabel.text = [obj valueForKey:@"name"];
    cell.detailTextLabel.text = [obj valueForKey:@"track"];
    
    [self.activityIndicator stopAnimating];
    //[self.activityIndicator hidesWhenStopped];
    self.activityIndicator.hidden=YES;
    return cell;
}

- (IBAction)download:(id)sender
{
   
    [self.activityIndicator startAnimating];
    [self downloadData];
  
   
    
}
-(NSManagedObjectContext*)getContext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext* context = [app managedObjectContext];
    return context;
}
-(void)fetchData
{
   
    NSManagedObjectContext* context = [self getContext];
    NSFetchRequest* fetch = [NSFetchRequest fetchRequestWithEntityName:@"DataTask"];
    NSError* error =nil;
    self.coreObj = [[NSMutableArray alloc]initWithArray:[context executeFetchRequest:fetch error:&error]];
   
    
}
-(void)downloadData
{
    self.modelArray=[[NSMutableArray alloc]init];
    NSURLSession* session  = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"]completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                {
        NSError* errorparsing = nil;
        if(error==nil){
        self.jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&errorparsing];

                    if(errorparsing==nil)
                        {
                            
                        self.jsonArray = [self.jsonDict valueForKey:@"results"];
                            NSManagedObjectContext* context = [self getContext];
                            for(NSDictionary *dict in self.jsonArray)
                            {
                                 NSManagedObject* person = [NSEntityDescription insertNewObjectForEntityForName:@"DataTask" inManagedObjectContext:context];
    
        self.nme = [dict valueForKey:@"artistName"];
        self.tra = [dict valueForKey:@"trackName"];
                                NSLog(@"%@",self.nme);
                                NSLog(@"%@",self.tra);
                [person setValue:self.nme forKey:@"name"];
                [person setValue:self.tra forKey:@"track"];
                                NSError* error = nil;
                                
                                if(self.coreObj.count==0)
                                {
                                if([context save:&error])
                                {
                                    NSLog(@"saved data done");
                                    
                                }
                                else{
                                    NSLog(@"failed to save data %@",error.localizedDescription);
                                }
                                }
                                else{
                                    [self.tableDisplay reloadData];
                                    }

                                
                        }
                                              }
                                          }
                    [self fetchData];
                    [self.tableDisplay reloadData];
                                          [self.activityIndicator stopAnimating];
                                          //[self.activityIndicator hidesWhenStopped];
                                          self.activityIndicator.hidden=YES;
                                          
                                      }];
    
    [dataTask resume];

}
@end
