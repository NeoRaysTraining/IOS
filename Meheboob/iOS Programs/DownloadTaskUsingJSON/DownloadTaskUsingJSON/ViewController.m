//
//  ViewController.m
//  DownloadTaskUsingJSON
//
//  Created by Mahaboobsab Nadaf on 18/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{


    NSDictionary *json;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.artistName = [[NSMutableArray alloc]init];
    self.artistID = [[NSMutableArray alloc]init];
    
    self.artistsObject = [[NSMutableArray alloc]init];
    json = [[NSDictionary alloc]init];
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downLoad:(id)sender {
    
    
    
    //Creates the context object
        NSManagedObjectContext* context=[self getContext];
    
    //Creates the fetch request object to fetch data from CoreData
        NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Artists"];
    //Creates NSError Object and assigns it to null
    NSError* error=nil;
    
    //Save the Coredata Objects in Mutable Array
  self.artistsObject = [[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    
    //Getting JSON Values
    if (self.artistsObject.count == 0) {
       
        //Creates session Object
    NSURLSession *session = [NSURLSession sharedSession];
    
        //Creates NSURLSessionDataTask object by using JSON url
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"]completionHandler:^(NSData * data, NSURLResponse *  response, NSError *  error) {
        json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        NSManagedObjectContext *context = [self getContext];
        
       
        
        //Gets the JSON of results Key
        NSArray *jsonResults = [json objectForKey:@"results"];
        
        
        for (NSDictionary *performerDic in jsonResults) {
            
          NSManagedObject *artistsObjectFromDB = [NSEntityDescription insertNewObjectForEntityForName:@"Artists" inManagedObjectContext:context];
            
            NSString *tempName = [performerDic objectForKey:@"artistName"];
            
            [artistsObjectFromDB setValue:tempName forKey:@"artistName"];
            
            NSString *tempId = [NSString stringWithFormat:@"%@", [performerDic objectForKey:@"artistId"]];
            
            [artistsObjectFromDB setValue:tempId forKey:@"artistID"];
            
            if (![context save:nil]) {
                NSLog(@"Not Saved");
            }
            else{
                NSLog(@"Data Saved Successfully");
                 [ self.MyTableView reloadData];
            
            }
          
           
        }
        
        
        
        
    }];
 
   [dataTask resume];
      [ self relaodTable];
     }
    
  
    else{
    
        NSLog(@"Data is present");
        
        [self relaodTable];
    
    }
    
    

    [self relaodTable];
    
}

- (IBAction)delete:(id)sender {
    
    //Delete the CoreData Object
    
    NSManagedObjectContext* context=[self getContext];
    
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Artists"];
    
    NSError* error=nil;
    
    NSArray *delete = [[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    for (int i=0; i < self.artistsObject.count; i++) {
        
        [context deleteObject:[delete objectAtIndex:i]];
        
        if (![context save:&error]) {
            NSLog(@"Problem in deleting");
        }
        
        else{
            NSLog(@"Deleted Successfully..");
        }
        
    }
//Reloads the TableView
    [self relaodTable];
}



//Creating Context to fetch data from CoreData
-(NSManagedObjectContext *)getContext{


    //Creates the App Delegate Object
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    
    //creates NSManagedObjectContext
    NSManagedObjectContext *context = [appdelegate managedObjectContext];
    
    //Returns the App delegate context
    return context;

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    //returns numberOfRowsInSection as artistsObject count
    return  self.artistsObject.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Creating tableView cell with identifier
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSManagedObject *artObject = [self.artistsObject objectAtIndex:indexPath.row];
    
    [cell.textLabel setFont:[UIFont systemFontOfSize:20.0]];
    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:15.0]];
    
    
    cell.textLabel.textColor = [UIColor redColor];
    cell.detailTextLabel.textColor = [UIColor blueColor];
    
    cell.textLabel.text = [artObject valueForKey:@"artistName"];
    cell.detailTextLabel.text = [artObject valueForKey:@"artistID"];
    
    return cell;

}

//Reloads the tableView data
-(void)relaodTable{

    [self.MyTableView reloadData];

}
@end
