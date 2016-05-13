//
//  ViewController.m
//  WebServiceUsingNSUrl
//
//  Created by test on 13/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ArtistClass.h"

@interface ViewController ()

@end

@implementation ViewController{

    NSDictionary *json;
    UITableViewCell * cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Starts animation of activity
    [self.activity startAnimating];
    
    
    self.artistID = [[NSMutableArray alloc]init];
    self.artistName = [[NSMutableArray alloc]init];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"]completionHandler:^(NSData * data, NSURLResponse *  response, NSError *  error) {
        json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
      //NSLog(@"json is : %@",json);
        
        NSArray *performersArray = [json objectForKey:@"results"];
        for (NSDictionary *performerDic in performersArray) {
          //  NSLog(@"%@", [performerDic objectForKey:@"artistName"]);
            
            [self.artistName addObject:[performerDic objectForKey:@"artistName"]];
        }
        
        
        NSArray *performersArray2 = [json objectForKey:@"results"];
        for (NSDictionary *performerDic2 in performersArray2) {
            //  NSLog(@"%@", [performerDic objectForKey:@"artistName"]);
            
            [self.artistID addObject:[performerDic2 objectForKey:@"artistId"]];
            
        }
        
       
        [self.myTableView reloadData];
            //NSLog(@"Artists Names: %@",self.artistName);
        
            //NSLog(@"Artists Names: %@",self.artistID);
       
        
        //Stops animation of activity
        [self.activity stopAnimating];
        
        //Hides the animation
        [self.activity setHidesWhenStopped:YES];
    }];
   
    [dataTask resume];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.artistName.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  
 cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    
    ArtistClass *artistClass = [[ArtistClass alloc]initWithID:[self.artistID objectAtIndex:indexPath.row] initWithName:[self.artistName objectAtIndex:indexPath.row]];
    
    cell.textLabel.textColor = [UIColor redColor];
    
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    
    cell.detailTextLabel.textColor = [UIColor blueColor];
    
    cell.detailTextLabel.font = [UIFont systemFontOfSize:15.0];
    
    //Bu using NSMutable array to set text values to cell labels
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%@",[ self.artistID objectAtIndex:indexPath.row]];
    // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[ self.artistName objectAtIndex:indexPath.row]];
    
    
    //Bu using artistClass to set text values to cell labels
    
    cell.textLabel.text = [NSString stringWithFormat:@"Artist ID : %@",artistClass.artistId];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Artist Name : %@",artistClass.artistName];
    
   
    return cell;
}




@end
