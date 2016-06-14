//
//  searchController.m
//  WhetherApp
//
//  Created by Mahaboobsab Nadaf on 07/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "searchController.h"

@interface searchController ()

@end

@implementation searchController


   


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Initially Hides the activity indicator
    self.activity.hidden = YES;
    
    //Initializes and allocates the memory for the variables
    self.jsonAPICity = [[NSDictionary alloc] init];
    self.cityUrl = [[NSString alloc] init];
    self.cityNames = [[NSMutableArray alloc]init];
    self.cityCountry = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Sets number of rows for table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.cityNames.count;

}

//Sets text for TableView labels
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor blueColor];
    
    cell.textLabel.text = [self.cityNames objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.cityCountry objectAtIndex:indexPath.row];
    
    return cell;
}












//Calls the delegate method to send data
- (void)setData:(NSString *)data
{
    [self.delegate setData:data];
}

- (IBAction)searchLocation:(id)sender {
    
    //Dismisses keyboard
    [self.searchLocation resignFirstResponder];
    
    self.activity.hidden = NO;
    
    //Removes all objects from the array
    [self.cityNames removeAllObjects];
    [self.cityCountry removeAllObjects];
    
    NSString *str =self.searchLocation.text;
    
  
  
    //Removes white spaces occorance in url string
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //Search URL
      self.cityUrl = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/search.ashx?key=0494752a675946e292d55629160406&q=%@&format=json",str];
    
    [self.activity startAnimating];
    
    //Calls the session using var cityUrl
    [self getCitySession:self.cityUrl];
    

    
   // NSLog(@"City Text is : %@",self.cityUrl);
}


//Gets JSON
-(void)getCitySession : (NSString *)jsonUrlStr{
    
    //Creates session

    NSURLSession *session2 = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session2 dataTaskWithURL:[NSURL URLWithString:jsonUrlStr]completionHandler:^(NSData * data, NSURLResponse *  response, NSError *  error) {
        
        //Checks for error JSON
        self.jsonAPICity = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *performersArrayError = [self.jsonAPICity objectForKey:@"data"];
        
        //Checks whether error object is present in performersArrayError
        if ([performersArrayError valueForKey:@"error"]) {
           // NSLog(@"Error Occured");
            
            
           //Calls alert message
            [self callAlert];
            
            }
       
        //Checks for valid JSON
        else{
            
            //Stores search_api object in performersArray
        NSArray *performersArray = [self.jsonAPICity objectForKey:@"search_api"];
        
        performersArray = [performersArray valueForKey:@"result"];
        
       
            
        
           NSLog(@"performersArray is : %@",performersArray);
       
        NSArray *performersArrayCountry = [[NSArray alloc] init];
        
        performersArrayCountry = [performersArray valueForKey:@"country"];
       
        performersArray = [performersArray valueForKey:@"areaName"];
         NSLog(@"areaName : %@",performersArray);
        
        
        
        
      //Loop inside loop to remove braces in performerDic
        for (NSDictionary *performerDic in performersArray) {
            
            for (NSString *city in [performerDic valueForKey:@"value"]) {
                
                
                [self.cityNames addObject:city];
                
            }
            
            
        }
        NSLog(@"%@",self.cityNames);
      
            //Loop inside loop to remove braces in performerDic
        for (NSDictionary *performerDic in performersArrayCountry) {
            
            for (NSString *city in [performerDic valueForKey:@"value"]) {
                
                
                [self.cityCountry addObject:city];
                
            }
            
            
        }
       // NSLog(@"Country %@",self.cityCountry);
        
            [self performSelectorOnMainThread:@selector(reloadTableView) withObject:nil waitUntilDone:NO];

        self.activity.hidden =YES;
        [self.activity stopAnimating];
       
        
        
        
        
            
        
        }
        
    }];
    
    [dataTask resume];
    
    
    
}


-(void)reloadTableView{

[self.myTableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //Sends Selected tableView index to previous view controller
    [self.delegate getCity:self.cityNames];
    [self.delegate setData:[self.cityNames objectAtIndex:indexPath.row]];
    
    
    
    
    
       [self.navigationController popToRootViewControllerAnimated:YES];

}

//Alert Message
-(void)callAlert{


    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Eorror"
                                                                   message:@"Location is not found"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          
                                                              [self.activity stopAnimating];
                                                              self.activity.hidden = YES;
                                                          
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];


}
@end
