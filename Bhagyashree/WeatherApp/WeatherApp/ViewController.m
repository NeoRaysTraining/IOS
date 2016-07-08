
//
//  ViewController.m
//  WeatherApp
//
//  Created by test on 6/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate>
@property (nonatomic,strong) NSString* date1;
@property (nonatomic,strong) NSString* mintemp;
@property (nonatomic,strong) NSString* maxtemp;
@property (nonatomic,strong) NSMutableArray *mintempArray;
@property (nonatomic,strong) NSMutableArray *maxtempArray;
@property (nonatomic,strong) NSArray *array1;
@property (nonatomic,strong) NSDictionary *dict1;
@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSArray *dict2;
@property (nonatomic,strong) NSString *tempC;
@property (nonatomic,strong) NSMutableArray *descArray;
@property (weak, nonatomic) IBOutlet UILabel *cityLbl;
@property (weak, nonatomic) IBOutlet UILabel *tempCLbl;
@property (weak, nonatomic) IBOutlet UILabel *messageLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconDisplay;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarOutlet;
@property (nonatomic,strong) NSString *searchStr;
@property (nonatomic,strong) NSMutableArray *messageArray;
@property (nonatomic,strong) NSDictionary *descDict;
@property (nonatomic,strong) NSString *desc;
@property (nonatomic,strong) NSString *imgUrl;
@property (nonatomic,strong) NSMutableArray *searchCities;
@property (nonatomic,assign) int i;
@property (nonatomic,strong) NSString* trimmedCityName;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic,strong)NSArray* arrayWithoutDuplicates;
@property (nonatomic,strong)NSMutableArray* dateArray;
@property (weak, nonatomic) IBOutlet UILabel *minTempLbl;
@property (weak, nonatomic) IBOutlet UILabel *maxtempLbl;
@property (weak, nonatomic) IBOutlet UILabel *day1Lbl;
@property (weak, nonatomic) IBOutlet UILabel *day2Lbl;

@property (weak, nonatomic) IBOutlet UILabel *day3Lbl;
@property (weak, nonatomic) IBOutlet UILabel *mintempDisplay;

@property (weak, nonatomic) IBOutlet UILabel *maxtempdisplay;
@property (nonatomic,strong) NSString* cityStr;
@property(nonatomic,strong) NSDictionary* json;
@property (nonatomic,strong)NSString* msg;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dateArray=[[NSMutableArray alloc]init];
    _mintempArray=[[NSMutableArray alloc]init];
    _maxtempArray=[[NSMutableArray alloc]init];
    
    self.imageView.image=[UIImage imageNamed:@"sunny"];
    self.i=0;
    self.searchCities=[NSMutableArray arrayWithObjects:@"Bengaluru",@"Mysore",@"mumbai", nil];
    NSLog(@"%@",_searchCities);
    
    self.arrayWithoutDuplicates=[NSArray arrayWithArray:_searchCities];
      [self changeUrl:_searchCities[0]];
    NSLog(@"city at index 0: %@",_searchCities[0]);
    [self.activityIndicator setHidden:YES];
}

-(void)fetchAndDisplayCurrentConditions
{
    for (_dict2 in [_array1 valueForKey:@"current_condition"])
    {
       // NSLog(@"%@",_dict2);
        _tempC = [_dict2 valueForKey:@"temp_C"];
        NSLog(@"%@",self.tempC);
        NSArray *imageArray = [_dict2 valueForKey:@"weatherIconUrl"];
            for(NSDictionary *imgDict in imageArray)
            {
            NSString* imageUrl = [imgDict valueForKey:@"value"];
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
                _iconDisplay.image = [UIImage imageWithData:imageData];
            }
        _descArray = [_dict2 valueForKey:@"weatherDesc"];
        
        for(_descDict in _descArray)
        {
        _desc = [_descDict valueForKey:@"value"];
            NSLog(@"%@",_desc);
        }
        self.tempCLbl.text=self.tempC;
        self.messageLbl.text=self.desc;
    }
}

-(void)fetchAndDisplayCity
{
    for(_dict1 in [_array1 valueForKey:@"request"])
    {
        NSLog(@"%@",_dict1);
        NSString *city = [_dict1 valueForKey:@"query"];
        NSString *type = [_dict1 valueForKey:@"type"];
        NSLog(@"%@",city);
        NSLog(@"%@",type);
        self.cityLbl.text=[_dict1 valueForKey:@"query"];
    }
}

- (IBAction)swipeRight:(id)sender {
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    self.i--;
    if(self.i<0)
    {
        NSInteger myInt = [_arrayWithoutDuplicates count]-1;
        self.i=(int)myInt;
        [self changeUrl:[_arrayWithoutDuplicates objectAtIndex:self.i]];
    }
    else if(self.i>=[_arrayWithoutDuplicates count])
    {
        self.i=0;
        [self changeUrl:[_arrayWithoutDuplicates objectAtIndex:self.i]];
    }
    else
    {
        [self changeUrl:[_arrayWithoutDuplicates objectAtIndex:self.i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeLeft:(id)sender {
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    self.i++;
    if ([self.arrayWithoutDuplicates count] == self.i) {
        self.i= 0;
    }
    [self changeUrl:[_arrayWithoutDuplicates objectAtIndex:self.i]];
   }

-(void)changeUrl:(NSString*)cityName
{
    
    NSLog(@"received city name: %@",cityName);
    
    NSString* urlModStr=@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a6806d269e4a4bf79e360847160406&q=CityName&format=json&num_of_days=3";
   NSString* str = [urlModStr stringByReplacingOccurrencesOfString:@"CityName"
                                         withString:cityName];
    
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:str]completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        _json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
     //     NSLog(@"%@",_json);
        
        _array1 = [_json objectForKey:@"data"];
     //    NSLog(@"%@",_array1);
        if([_array1 valueForKey:@"error"])
        {
            NSLog(@"error occured");
            
            NSArray* msgArray=[_array1 valueForKey:@"error"];
            for(NSDictionary* msgDict in msgArray)
            {
                _msg=[msgDict valueForKey:@"msg"];
                NSLog(@"%@",_msg);
            }
            
            [self callAlert];
        }
        else
        {
        [self fetchAndDisplayCity];
        [self fetchAndDisplayCurrentConditions];
        [self fetchDate];
        [self fetchMaxAndMinTemp];
        }
        [self.activityIndicator stopAnimating];
        [self.activityIndicator setHidesWhenStopped:YES];
    }];
    [dataTask resume];
}
- (IBAction)searchButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"Segue" sender:self];
}

-(void)callAlert
{
    NSLog(@"in call alert");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert Message" message:_msg preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSLog(@"You pressed button OK");
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)fetchDate
{
    _dateArray=[[NSMutableArray alloc]init];
    for (_dict2 in [_array1 valueForKey:@"weather"])
    {
         NSLog(@"%@",_dict2);
    _date1 = [_dict2 valueForKey:@"date"];
            NSLog(@"dates are : %@",_date1);
        [_dateArray addObject:_date1];
    }
    NSLog(@"date array is : %@",_dateArray);
    self.day1Lbl.text=self.dateArray[0];
    self.day2Lbl.text=self.dateArray[1];
    self.day3Lbl.text=self.dateArray[2];
}

-(void)fetchMaxAndMinTemp
{
    _mintempArray=[[NSMutableArray alloc]init];
    _maxtempArray=[[NSMutableArray alloc]init];
        for (_dict2 in [_array1 valueForKey:@"weather"])
        {
            //  NSLog(@"%@",_dict2);
            _maxtemp = [_dict2 valueForKey:@"maxtempC"];
            NSLog(@"max tem :%@",_maxtemp);
            [_maxtempArray addObject:_maxtemp];
            
            _mintemp = [_dict2 valueForKey:@"mintempC"];
            NSLog(@" min tem : %@",_mintemp);
            [_mintempArray addObject:_mintemp];
        }
    NSLog(@"max temp array:%@",_maxtempArray);
    NSLog(@"min temp array :%@",_mintempArray);
    self.minTempLbl.text=_mintempArray[0];
    self.maxtempLbl.text=_maxtempArray[0];
}
- (IBAction)day1Button:(id)sender {
    NSLog(@"%@",_mintempArray[0]);
    self.minTempLbl.text=self.mintempArray[0];
    self.maxtempLbl.text=self.maxtempArray[0];
}

- (IBAction)day2button:(id)sender {
    self.minTempLbl.text=self.mintempArray[1];
    self.maxtempLbl.text=self.maxtempArray[1];
}

- (IBAction)day3button:(id)sender {
    self.minTempLbl.text=self.mintempArray[2];
    self.maxtempLbl.text=self.maxtempArray[2];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *controller =[segue destinationViewController];
    if([controller isKindOfClass:[ViewController2 class]])
    {
        ViewController2 *VC2= (ViewController2 *)controller;
        VC2.delegate=self;
    }
}
-(void)setData:(NSString *)data
{    
    NSLog(@"The data recived is : %@",data);
    _cityStr=data;
    NSLog(@"%@",_cityStr);
    
    _trimmedCityName = [_cityStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@",_trimmedCityName);
    
    [_searchCities addObject:_trimmedCityName];
    NSLog(@"city added to the searchcities array");
    NSLog(@"%@",_searchCities);
    
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:_searchCities];
    _arrayWithoutDuplicates = [orderedSet array];
    NSLog(@"array without duplicate: %@",_arrayWithoutDuplicates);
    NSLog(@"%@",_arrayWithoutDuplicates);
    
    [self changeUrl:[_arrayWithoutDuplicates objectAtIndex:[_arrayWithoutDuplicates count]-1]];
    
    NSInteger myInteger = [_arrayWithoutDuplicates count]-1;
    self.i = (int) myInteger;
    
}
@end
