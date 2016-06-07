//
//  ViewController.m
//  WheatherApp
//
//  Created by test on 6/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UILabel *countryName;
@property (strong, nonatomic) IBOutlet UILabel *weatherDesctionLbl;

@property (strong, nonatomic) IBOutlet UILabel *cityName;
@property (strong, nonatomic) IBOutlet UILabel *currentTemp;
@property (strong, nonatomic) IBOutlet UIImageView *currentConditonImg;

@property (strong,nonatomic) NSString *displayCity,*displayCountry,*currentTempF,*weatherImageUrl,*weatherDescription,*location,*feelStr;
@property (strong,nonatomic) NSMutableArray *citites;
@property (strong,nonatomic) NSURL *url;

@property (assign,nonatomic) int i;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UILabel *feel;
@end

@implementation ViewController
{
    NSMutableDictionary *json,*json1;
    NSMutableArray *arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.activityIndicator startAnimating];
    self.i=0;
    _citites=[[NSMutableArray alloc]initWithObjects:@"NewYork",@"Chennai", nil];
    self.url=[NSURL URLWithString:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a05c24ec448d426787555224160406&q=Bangalore&format=json&num_of_days=1"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a05c24ec448d426787555224160406&q=Bangalore&format=json&num_of_days=1"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", json);
        
        
        arrayData=[json valueForKey:@"data"];
        
        
        [self fetchingAndDisplayingLocationDetails:arrayData];
        [self fetchingAndDisplayingCurrentConditionImage:arrayData];
        
        self.countryName.text=self.displayCountry;
        self.cityName.text=self.displayCity;
        self.currentTemp.text=self.currentTempF;
        self.feel.text=self.feelStr;
        [self.activityIndicator stopAnimating];
    }];
    [dataTask resume];
    
    //
    //[self.activityIndicator setHidesWhenStopped:YES];
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *str=searchBar.text;
    NSLog(@"%@",str);
    [self.citites addObject:str];
    [self searchPerformAction:str];
    searchBar.text=@"";
    
}
-(void)fetchingAndDisplayingLocationDetails:(NSArray *)location
{
    NSArray *locationDetailsArray=[location valueForKey:@"request"];
        NSArray *cityCountry=[locationDetailsArray valueForKey:@"query"];
    NSString *locationDetails=[cityCountry objectAtIndex:0];
    NSLog(@"%@",locationDetails);
        NSString *match=@",";
        NSString *cityNameStr;
        NSString *countryNameStr;
        NSScanner *scanner = [NSScanner scannerWithString:locationDetails];
        [scanner scanUpToString:match intoString:&cityNameStr];
        [scanner scanString:match intoString:nil];
        countryNameStr = [locationDetails substringFromIndex:scanner.scanLocation];
        self.displayCity=cityNameStr;
        self.displayCountry=countryNameStr;
    
}
- (IBAction)changeLocation:(id)sender {
    
    [self swipePerformAction];
}

-(void)swipePerformAction
{
    
    
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    NSString *apiUrl=[self replaceLocation:[_citites objectAtIndex:self.i]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:apiUrl] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        
        json1 = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        NSLog(@"%@", json1);
        
        //[arrayData removeAllObjects];
        arrayData=[json1 valueForKey:@"data"];
        
        
        [self fetchingAndDisplayingLocationDetails:arrayData];
        [self fetchingAndDisplayingCurrentConditionImage:arrayData];
        
        self.countryName.text=self.displayCountry;
        self.cityName.text=self.displayCity;
        self.currentTemp.text=self.currentTempF;
        self.feel.text=self.feelStr;
        [self.activityIndicator stopAnimating];
    }];
    [dataTask resume];
    
    //[self.activityIndicator setHidden:YES];
    
    
    self.i++;
    
    if ([_citites count] == self.i) {
        self.i=0;
    }
    

}
-(void)searchPerformAction:(NSString*)srchStr
{
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    NSString *apiUrl=[self replaceLocation:srchStr];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:apiUrl] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        
        
        json1 = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        NSLog(@"%@", json1);
        
        //[arrayData removeAllObjects];
        arrayData=[json1 valueForKey:@"data"];
        
        
        [self fetchingAndDisplayingLocationDetails:arrayData];
        [self fetchingAndDisplayingCurrentConditionImage:arrayData];
        
        self.countryName.text=self.displayCountry;
        self.cityName.text=self.displayCity;
        self.currentTemp.text=self.currentTempF;
        self.feel.text=self.feelStr;
        [self.activityIndicator stopAnimating];
    }];
    [dataTask resume];
}

-(void)fetchingAndDisplayingCurrentConditionImage:(NSArray *)imageDetails

{
    NSArray *climate=[imageDetails valueForKey:@"current_condition"];
    
    NSArray *tempF=[climate valueForKey:@"temp_F"];
    self.currentTempF=[tempF objectAtIndex:0];
    
    NSArray *feelsLikeArray=[climate valueForKey:@"FeelsLikeF"];
    NSString *feel=[feelsLikeArray objectAtIndex:0];
    self.feelStr=feel;
    NSLog(@"%@",_feelStr);
    NSArray *weatherDesc=[climate valueForKey:@"weatherDesc"];
    NSArray *arrWeather=[weatherDesc valueForKey:@"value"];
    self.weatherDescription=[[arrWeather objectAtIndex:0] componentsJoinedByString:@""];
    
        NSArray *imgUrlValue=[climate valueForKey:@"weatherIconUrl"];
        NSArray *imgUrlArr=[imgUrlValue valueForKey:@"value"];
    
    self.weatherImageUrl=[[imgUrlArr objectAtIndex:0] componentsJoinedByString:@""];
    self.weatherDesctionLbl.text=_weatherDescription;
    self.currentConditonImg.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_weatherImageUrl]]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)replaceLocation:(NSString *)changeLocation
{
    [self.citites addObject:changeLocation];
    NSString *newUrl=[NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a05c24ec448d426787555224160406&q=%@&format=json&num_of_days=1",changeLocation];
    NSLog(@"%@",newUrl);
    return newUrl;
}

@end
