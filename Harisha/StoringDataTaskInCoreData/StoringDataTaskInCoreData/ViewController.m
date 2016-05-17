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
@property (strong,nonatomic)NSArray* coreObj;
- (IBAction)download:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Model* model = [self.modelArray objectAtIndex:indexPath.row];
    NSManagedObjectContext* context = [self getContext];
    
    
    NSManagedObject* person = [NSEntityDescription insertNewObjectForEntityForName:@"DataTask" inManagedObjectContext:context];
    
    
    
    
    
    NSLog(@"%@",self.coreObj);
    if(self.coreObj == NULL)
    {
        [person setValue:model.name forKey:@"data"];
        NSError* error = nil;
        if([context save:&error])
        {
            NSLog(@"saved data done");
            
        }
        else{
            NSLog(@"failed to save data %@",error.localizedDescription);
        }
    }
    
   // Model *model2 = [self.coreObj objectAtIndex:indexPath.row];
    

    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.track;
    
    return cell;
}

- (IBAction)download:(id)sender
{
   
    
    [self.activityIndicator startAnimating];
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
                                                  
                                                  for(NSDictionary *dict in self.jsonArray)
                                                  {
                            Model* model = [[Model alloc]initWithName:[dict valueForKey:@"artistName"] trackName:[dict valueForKey:@"trackName"]];
                        [self.modelArray addObject:model];
                                                      
                                                  }
                                              }
                                          }
                                          [self.tableDisplay reloadData];
                                          [self.activityIndicator stopAnimating];
                                          //[self.activityIndicator hidesWhenStopped];
                                          self.activityIndicator.hidden=YES;
                                          
                                      }];
    
    [dataTask resume];
   
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
    NSFetchRequest* fetch = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSError* error =nil;
    self.coreObj = [context executeFetchRequest:fetch error:&error];

}
@end
