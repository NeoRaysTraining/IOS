//
//  ViewController.m
//  WeatherAppDemo
//
//  Created by test on 6/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "SearchViewController.h"
#import "CollectionViewCell.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

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
@property(strong,nonatomic)NSString* weatherDescriptio;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveData:) name:@"citiesListComplete" object:nil];
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
            
            
            
//            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//            NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
//            int weekday = [comps weekday];
//            NSLog(@"The week day number: %d", weekday);
           
       
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
    
    NSLog(@"weather description %@",self.weatherDescriptio);
    NSLog(@"if condition %i",[self.weatherDescriptio isEqualToString:@"Partly Cloudy"]);
    
        
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden=YES;
    
    
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
       // [self.activityIndicator stopAnimating];
    //self.activityIndicator.hidden=YES;
    
    
    
    
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
    self.weatherDescriptio=[[[weatherDesc valueForKey:@"value"] objectAtIndex:0] componentsJoinedByString:@""];
   // NSLog(@"%@",descName);

    self.currentConditionLabel.text = self.weatherDescriptio;
    
   
   
    
    //[self.tableview1 reloadData];
    
}
- (IBAction)changeDiffrentLocation:(id)sender
{
    
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
    self.activityIndicator.hidden = false;
    [self.activityIndicator startAnimating];
    
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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSLog(@"The day of the week: %@", [dateFormatter stringFromDate:[NSDate date]]);
    
  
    
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
   NSArray*dateArr =[self.jsonArray valueForKey:@"weather"];
    
    NSLog(@"dates %@",[dateArr[indexPath.row] valueForKey:@"date"]);
    
    cell.datesLabel.text = [dateArr[indexPath.row] valueForKey:@"date"];
    
    NSArray* imgArray = [self.jsonArray valueForKey:@"current_condition"];
    
    NSLog(@"current condtion %@",imgArray);
    NSArray* imageUrl = [imgArray valueForKey:@"weatherIconUrl"];
    NSArray* currentImageUrl = [imageUrl valueForKey:@"value"];
    NSString *weatherIcon=[[currentImageUrl objectAtIndex:0] componentsJoinedByString:@""];
    
  cell.temperatureLabel.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:weatherIcon]]];
    
   
   
    cell.MaxTemperatureLabel.text = [dateArr[indexPath.row] valueForKey:@"maxtempC"];
    cell.minTemperature.text = [dateArr[indexPath.row]valueForKey:@"mintempC"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray*dateArr =[self.jsonArray valueForKey:@"weather"];
    self.currentTemperatureLabel.text = [dateArr[indexPath.row] valueForKey:@"maxtempC"];
    
   
    
    
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

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString* newUrl = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a3ce7967a5ff4216bd555247160406&q=%@&format=json&num_of_days=5",searchBar.text];
    
    NSLog(@"the new url %@",newUrl);
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:newUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
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
- (IBAction)searchButton:(id)sender
{
    [self performSegueWithIdentifier:@"scene1" sender:self];
}

-(void)receiveData:(NSNotification*)locationName
{
   NSString* location = [[locationName userInfo] valueForKey:@"location"];
    [self.activityIndicator setHidden:YES];
    [self.activityIndicator startAnimating];
    
    NSLog(@"Location is %@",location);
    NSString* newUrl = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a3ce7967a5ff4216bd555247160406&q=%@&format=json&num_of_days=5",location];
    NSLog(@"new url %@",newUrl);
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:newUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
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
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.currentDate.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   // UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSArray*dateArr =[self.jsonArray valueForKey:@"weather"];
    
    NSLog(@"dates %@",[dateArr[indexPath.row] valueForKey:@"date"]);
    
  //  cell.datesLabel.text = [dateArr[indexPath.row] valueForKey:@"date"];
    
    NSArray* imgArray = [self.jsonArray valueForKey:@"current_condition"];
    
    NSLog(@"current condtion %@",imgArray);
    NSArray* imageUrl = [imgArray valueForKey:@"weatherIconUrl"];
    NSArray* currentImageUrl = [imageUrl valueForKey:@"value"];
    NSString *weatherIcon=[[currentImageUrl objectAtIndex:0] componentsJoinedByString:@""];
    
    cell.collectionImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:weatherIcon]]];
    
    
    
    cell.maxTemperature.text = [dateArr[indexPath.row] valueForKey:@"maxtempC"];
    //cell.minTemperature.text = [dateArr[indexPath.row]valueForKey:@"mintempC"];
    return cell;

}

@end
