//
//  ViewController.m
//  WeatherAppDemo
//
//  Created by test on 6/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backGroundImage;
@property(strong,nonatomic)NSDictionary* json;
@property(strong,nonatomic)NSArray* jsonArray;
@property(strong,nonatomic)NSArray* weatherArray;
@property(strong,nonatomic)NSArray* hourlyReport;
@property(strong,nonatomic)NSDictionary* dict;
@property(strong,nonatomic)NSMutableArray* diffrentLocations;
@property(strong,nonatomic)NSArray* currentDate;
@property(assign,nonatomic)int i ;
@property(strong,nonatomic)NSMutableArray* allDates;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.i = 0;
    self.allDates = [[NSMutableArray alloc]init];
    [self.activityIndicator startAnimating];
    //self.backGroundImage.image = [UIImage imageNamed:@"background"];
    
   // self.imageDisplay.image = [UIImage imageNamed:@"dis1"];
    self.diffrentLocations = [[NSMutableArray alloc]initWithObjects:@"Hyderabad",@"Delhi",@"Mysore",@"pune",@"Manglore", nil];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a3ce7967a5ff4216bd555247160406&q=Bangalore&format=json&num_of_days=5"] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
        {
          self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
           // NSLog(@"%@",json);
           
            self.jsonArray = [self.json valueForKey:@"data"];
            NSLog(@"value is %@",self.jsonArray);
            
            [self fetchLocationDetails];
            [self fetchWeatherDetails];
            [self fetchImageFromServer];
            [self fetchDate];
            
            
           
       
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
    
    
    
   // self.backGroundImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:weatherIcon]]];
}

-(void)fetchDate
{
    NSArray* dateArray = [self.jsonArray valueForKey:@"weather"];
    self.currentDate = [dateArray valueForKey:@"date"];
    
    NSArray* tomdate = [self.jsonArray valueForKey:@"weather"];
    NSLog(@"current date %@",[tomdate[0]  valueForKey:@"date"]);
    NSLog(@"tomorow date %@",[tomdate[1] valueForKey:@"date"]);
  //  self.allDates = []
        [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden=YES;
    
    [self.tableview1 reloadData];
}


-(void)fetchWeatherDetails
{
    NSArray* weatherCondition = [self.jsonArray valueForKey:@"current_condition"];

    
   // NSLog(@"Current temperature %@",[[weatherCondition valueForKey:@"temp_C"]componentsJoinedByString:@""]);
    
    self.currentTemperatureLabel.text = [[weatherCondition valueForKey:@"temp_C"  ]componentsJoinedByString:@""];
    
   
    
   // NSLog(@"current date is %@",self.currentDate);
    
    NSArray* currentCondtion = [self.jsonArray valueForKey:@"current_condition"];
    NSArray* weatherDesc = [currentCondtion valueForKey:@"weatherDesc"];
    NSString* current = [[weatherDesc objectAtIndex:0]componentsJoinedByString:@""];
    
  //  NSLog(@"current condition %@",current );
    self.currentConditionLabel.text = current;
   
   
    
    //[self.tableview1 reloadData];
    
}
- (IBAction)changeDiffrentLocation:(id)sender
{
    
    [self.activityIndicator startAnimating];
    [self swipePerformAction];
    
    if(self.i==4)
    {
       self.i=0;
    }
    self.i++;
    
    [self.tableview1 reloadData];
    
}

-(void)swipePerformAction
{
    NSString* apiUrl = [self replaceLocation:[_diffrentLocations objectAtIndex:self.i]];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:apiUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
                                      {
                                          self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                          // NSLog(@"%@",json);
                                          
                                          self.jsonArray = [self.json valueForKey:@"data"];
                                          NSLog(@"value is %@",self.jsonArray);
                                          
                                          [self fetchLocationDetails];
                                          [self fetchWeatherDetails];
                                          [self fetchImageFromServer];
                                      }
                                      ];
    
    [dataTask resume];
                        
}

-(NSString*)replaceLocation:(NSString*)changeLocation
{
    [self.diffrentLocations addObject:changeLocation];
    
    NSString* newUrl = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a3ce7967a5ff4216bd555247160406&q=%@&format=json&num_of_days=5",changeLocation];
    NSLog(@"new url %@",newUrl);
    return newUrl;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"no of rows %ld",self.currentDate.count);
    return self.currentDate.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //NSLog(@"data %@",[self.currentDate objectAtIndex:0]);
   NSArray*dateArr =[self.jsonArray valueForKey:@"weather"];
    
    NSLog(@"dates %@",[dateArr[indexPath.row] valueForKey:@"date"]);
    
    cell.datesLabel.text = [dateArr[indexPath.row] valueForKey:@"date"];
    
    NSArray* imgArray = [self.jsonArray valueForKey:@"current_condition"];
    
    NSLog(@"current condtion %@",imgArray);
    NSArray* imageUrl = [imgArray valueForKey:@"weatherIconUrl"];
    NSArray* currentImageUrl = [imageUrl valueForKey:@"value"];
    NSString *weatherIcon=[[currentImageUrl objectAtIndex:0] componentsJoinedByString:@""];
    
  cell.temperatureLabel.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:weatherIcon]]];
    
   // NSArray* tempArr = [dateArr[indexPath.row] valueForKey:@"maxtempC"];
   // NSLog(@"current %@",tempArr);
   
    cell.MaxTemperatureLabel.text = [dateArr[indexPath.row] valueForKey:@"maxtempC"];
    cell.minTemperature.text = [dateArr[indexPath.row]valueForKey:@"mintempC"];
    return cell;
}

-(void)fetchLocationDetails
{
    NSArray* locationDetails = [self.jsonArray valueForKey:@"request"];
        NSLog(@"parsed data %@",locationDetails);
        
        NSLog(@"%@",[locationDetails valueForKey:@"type"]
              );
        NSLog(@"%@",[locationDetails valueForKey:@"query"]
              );
       
        self.locationLabel.text = [[locationDetails valueForKey:@"query"]componentsJoinedByString:@""];
        
    
   
}

@end
