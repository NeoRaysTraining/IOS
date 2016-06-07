//
//  ViewController.m
//  WeatherAppDemo
//
//  Created by test on 6/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)NSDictionary* json;
@property(strong,nonatomic)NSArray* jsonArray;
@property(strong,nonatomic)NSArray* weatherArray;
@property(strong,nonatomic)NSArray* hourlyReport;
@property(strong,nonatomic)NSDictionary* dict;
@property(strong,nonatomic)NSMutableArray* diffrentLocations;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageDisplay.image = [UIImage imageNamed:@"dis1"];
    self.diffrentLocations = [[NSMutableArray alloc]initWithObjects:@"Hyderabad",@"Delhi",@"Mysore",@"pune",@"Manglore", nil];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a3ce7967a5ff4216bd555247160406&q=Bangalore&format=json&num_of_days=1"] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
        {
          self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
           // NSLog(@"%@",json);
           
            self.jsonArray = [self.json valueForKey:@"data"];
            NSLog(@"value is %@",self.jsonArray);
            
            for (NSArray* locationDetails in [self.jsonArray valueForKey:@"request"]) {
                NSLog(@"parsed data %@",locationDetails);
                
                NSLog(@"%@",[locationDetails valueForKey:@"type"]
                      );
                NSLog(@"%@",[locationDetails valueForKey:@"query"]
                      );
                self.cityLabel.text = [NSString stringWithFormat:@"%@",[locationDetails valueForKey:@"type"]];
                self.locationLabel.text = [locationDetails valueForKey:@"query"];
                
            }
            [self fetchWeatherDetails];
            [self fetchImageFromServer];
            [self fetchDate];
            [self changeLocation];
            
            [self.tableview1 reloadData];
       
                                }];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fetchImageFromServer
{
    NSArray* imgArray = [self.jsonArray valueForKey:@"current_condition"];
    
    NSLog(@"current condtion %@",imgArray);
    NSArray* imageUrl = [imgArray valueForKey:@"weatherIconUrl"];
    NSArray* currentImageUrl = [imageUrl valueForKey:@"value"];
    NSString *weatherIcon=[[currentImageUrl objectAtIndex:0] componentsJoinedByString:@""];
    NSLog(@"image url %@",weatherIcon);
    
    
    
    self.imageDisplay.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:weatherIcon]]];
}

-(void)fetchDate
{
    NSArray* dateArray = [self.jsonArray valueForKey:@"weather"];
    
    NSArray* currentDate = [dateArray valueForKey:@"date"];
    
    NSLog(@"current date %@",currentDate);
}


-(void)fetchWeatherDetails
{
    NSArray* weatherCondition = [self.jsonArray valueForKey:@"current_condition"];

    
    NSLog(@"Current temperature %@",[[weatherCondition valueForKey:@"temp_C"]componentsJoinedByString:@""]);
    
    self.currentTemperatureLabel.text = [[weatherCondition valueForKey:@"temp_C"  ]componentsJoinedByString:@""];
    
}
- (IBAction)changeDiffrentLocation:(id)sender {
}

-(void)changeLocation
{
    NSString* changeLocation;
    
    [self.diffrentLocations addObject:changeLocation];
    
    NSString* newUrl = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a3ce7967a5ff4216bd555247160406&q=%@&format=json&num_of_days=1",changeLocation];
    
    NSLog(@"location %@",newUrl);
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"%@",self.hourlyReport);
    NSLog(@"%@",[NSNumber numberWithInteger:self.hourlyReport.count]);
   
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
   // cell.textLabel.text = self.hourlyReport[indexPath.row];
   // cell.textLabel.text = [self.hourlyReport objectAtIndex:0];
    
    return cell;
}


@end
