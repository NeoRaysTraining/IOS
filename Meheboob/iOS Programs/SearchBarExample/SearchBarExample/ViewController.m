//
//  ViewController.m
//  SearchBarExample
//
//  Created by test on 23/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{


    NSDictionary *json;
    NSMutableArray *shortResults;
    NSManagedObject *artObject;
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


- (IBAction)Download:(id)sender {
    
    [self relaodTable];
    
    //Creates the context object
    NSManagedObjectContext* context=[self getContext];
    
    //Creates the fetch request object to fetch data from CoreData
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Artists"];
    //Creates NSError Object and assigns it to null
    NSError* error=nil;
    
    //Save the Coredata Objects in Mutable Array
    self.artistsObject = [[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    //Taking temp var to hold values for Search
    shortResults = [[NSMutableArray alloc]initWithArray:self.artistsObject];
    
    NSLog(@"Short Results is : %@",shortResults);
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
    return  shortResults.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Creating tableView cell with identifier
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
     artObject = [shortResults objectAtIndex:indexPath.row];
    
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

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    if (searchText.length == 0) {
        
        //removes all objects of shortResults when Search text is nil and reload all Objects again
        [shortResults removeAllObjects];
        
        [shortResults addObjectsFromArray:self.artistsObject];
    }
    

    else{
    
        //removes Previously Loaded Data to reload new Search
    [shortResults removeAllObjects];
        
        for (artObject in _artistsObject) {
            
            //Stores the object according to searchText and artistName in artObject
            
            //NSRange is used to count number of serch results after searching
            NSRange r=[[artObject valueForKey:
                        @"artistName"] rangeOfString:searchText];
         //options:NSCaseInsensitiveSearch
            
            
            //If Object Found According to Search
            if (r.location!=NSNotFound) {
                
                //Stores the Searched objects in mutableArray shortResults
                [shortResults addObject:artObject];
            }
        }
    }
    
    //Reloads the Table View
    [self.MyTableView reloadData];
}
@end
