//
//  ViewController.m
//  WeatherApp
//
//  Created by Mahaboobsab Nadaf on 04/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic)   NSArray *performersArray2;

@end

@implementation ViewController{
int buttonCount;
int placeCount;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

 [self checkForNetworkConnection];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Button 1
- (IBAction)getWeather:(id)sender {
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    [self updateButton:self.zerothArray];

}

//Button 2
- (IBAction)secondButton:(id)sender {
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    [self updateButton:self.firstArray];
    
}

//Button 3
- (IBAction)thirdButton:(id)sender {
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    [self updateButton:self.secondArray];
}


//Loads data in ViewController
-(void)loadData{
    @try {
        
   
   // self.activityIndicator.hidden = YES;
        NSArray *temp = [self.cityDetails valueForKey:@"query"];
    temp = temp[0];
        NSArray *tempForTemp = [self.cityTemp valueForKey:@"temp_C"];
    
    
        NSArray *feelsLike = [self.cityTemp valueForKey:@"FeelsLikeC"];
        NSArray *cloudCover = [self.cityTemp valueForKey:@"cloudcover"];
    
        NSArray *himidity = [self.cityTemp valueForKey:@"humidity"];
        NSArray *pressure = [self.cityTemp valueForKey:@"pressure"];
        NSArray *observationTime = [self.cityTemp valueForKey:@"observation_time"];
    
        NSArray *weatherDescObj = [self.cityTemp valueForKey:@"weatherDesc"];
    
        //Set Image
    //    NSArray *tempForTempImage = [self.cityTemp valueForKey:@"weatherIconUrl"];
    
    //    NSArray *imageUrl = [tempForTempImage valueForKey:@"value"];
        NSArray *weatherDes = [weatherDescObj valueForKey:@"value"];
    
       // imageUrl = [imageUrl objectAtIndex:0];
      //  imageUrl = [imageUrl objectAtIndex:0];
        weatherDes = [weatherDes objectAtIndex:0];
    
       // NSString *finalStr = [NSString stringWithFormat:@"%@" ,[imageUrl objectAtIndex:0]];
    
        weatherDes = weatherDes[0];
        NSString *finalWeather = [weatherDes objectAtIndex:0];
    
    [self updateImage:finalWeather];
    
//        NSString *url = finalStr;
//    NSString *ImageURL = url;
//    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
//    self.tempImageView.image = [UIImage imageWithData:imageData];
    
        self.cityLabel.text = [NSString stringWithFormat:@"%@",temp[0]];
    tempForTemp = tempForTemp[0];
        self.tempLabel.text = [NSString stringWithFormat:@"+%@°C",tempForTemp[0]];
    
    
        feelsLike = feelsLike[0];
        self.feelsLike.text = [NSString stringWithFormat:@"+%@°C",feelsLike[0]];
    
    cloudCover = cloudCover[0];
        self.cloudCover.text = [NSString stringWithFormat:@"%@",cloudCover[0]];
    
    himidity = himidity[0];
        self.humiDity.text = [NSString stringWithFormat:@"%@%%",himidity[0]];
    
    pressure = pressure[0];
        self.pressure.text = [NSString stringWithFormat:@"%@ hPa",pressure[0]];
    
    observationTime = observationTime[0];
        self.observationTime.text = [NSString stringWithFormat:@"%@",observationTime[0]];
        self.weatherDesc.text = [NSString stringWithFormat:@"It's %@ ...",finalWeather];
    
    
        self.dateLabel.text = [NSString stringWithFormat:@"%@",self.cityTempDate];
    
    
    //Label Date
    [self dateFormatter:1 :[self.zerothArray valueForKey:@"date"]];
     [self dateFormatter:2 :[self.firstArray valueForKey:@"date"]];
     [self dateFormatter:3 :[self.secondArray valueForKey:@"date"]];
   
  
    
    
    
    [self updateButtonTemp];
    
    self.activityIndicator.hidden = YES;
        [self.activityIndicator stopAnimating];
    } @catch (NSException *exception) {
        NSLog(@"Exception cought..");
    } @finally {
        NSLog(@"Inside finally block");
    }
}

-(void)stopAnimation{

    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
}

//Gets JSON
-(void)getSession : (NSString *)jsonUrl{
    @try {
        
    
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    [self.cityDetails removeAllObjects];
    [self.cityTemp removeAllObjects];
    self.urlString = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=0494752a675946e292d55629160406&q=%@&format=json&num_of_days=3",jsonUrl];
    self.urlString = [self.urlString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:self.urlString]completionHandler:^(NSData * data, NSURLResponse *  response, NSError *  error) {
        self.jsonAPI = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        
     //   NSLog(@"JSON is : %@",self.jsonAPI);
      
        
        NSArray *performersArray = [self.jsonAPI objectForKey:@"data"];
        
        
        if ([performersArray valueForKey:@"error"]) {
            NSLog(@"Error Occured");
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                           message:@"Location is not found"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                  
                                                                      [self.activityIndicator stopAnimating];
                                                                      self.activityIndicator.hidden = YES;
                                                                  
                                                                  }];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
        
            NSDictionary *performDic1 = [performersArray valueForKey:@"request"];
            [self.cityDetails addObject:performDic1];
            
            NSDictionary *performDic2 = [performersArray valueForKey:@"current_condition"];
            
            [self.cityTemp addObject:performDic2];
            
            NSDictionary *performDic3 = [performersArray valueForKey:@"weather"];
            
            self.cityTempDate = [performDic3 valueForKey:@"date"];
            self.cityTempDate =[self.cityTempDate  objectAtIndex:0];
            
            NSArray *secondObject = [performersArray valueForKey:@"weather"];
            self.zerothArray = [secondObject objectAtIndex:0];
            self.firstArray = [secondObject objectAtIndex:1];
            self.secondArray = [secondObject objectAtIndex:2];
            
            [self updateButtonTemp];
            [self loadData];

        
        
        
        
        }
      
        
        

              }];
    
    [dataTask resume];
    
    } @catch (NSException *exception) {
        
        if (exception.name == NSInvalidArgumentException) {
              NSLog(@"Cought Exception..");
        }
      
        
    } @finally {
        
        if ([self.jsonAPI count]== 0) {
              NSLog(@"Inside if finally block");
        }
        NSLog(@"Inside finally block");
    }
    
    
}













-(void)updateButton : (NSArray *)dateArray{

    self.transferArray = dateArray;
    
    [NSTimer    scheduledTimerWithTimeInterval:1.0    target:self    selector:@selector(stopAnimation)    userInfo:nil repeats:NO];
    
    self.changeInObschanceofrain.text = @"Chance Of Rain";
    
    NSArray *temp = [self.cityDetails valueForKey:@"query"];
    
    temp = temp[0];
    self.cityLabel.text = [NSString stringWithFormat:@"%@",temp[0]];
    
    NSArray *tempDate = [self.transferArray valueForKey:@"date"];
    
    NSLog(@"Second Button Date is : %@",tempDate);
    
    self.dateLabel.text =[NSString stringWithFormat:@"%@",tempDate];
    
    //maxtempC
    
    NSArray *tempMax = [self.transferArray valueForKey:@"maxtempC"];
    
    
    NSLog(@"Second Button maxtempC is : %@",tempMax);
    
    self.tempLabel.text =[NSString stringWithFormat:@"+%@°C",tempMax];
    
    //Image hourly
//    NSArray *tempImage = [self.transferArray valueForKey:@"hourly"];
//    
//    tempImage = [tempImage valueForKey:@"weatherIconUrl"];
//    
//    tempImage = [tempImage objectAtIndex:0];
//    tempImage = [tempImage objectAtIndex:0];
//    
//    tempImage = [tempImage valueForKey:@"value"];
//    
//    NSString *url = [NSString stringWithFormat:@"%@",tempImage];
//    NSString *ImageURL = url;
//    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
//    self.tempImageView.image = [UIImage imageWithData:imageData];
//    
//    NSLog(@"Second Image maxtempC is : %@",tempImage);
    
    //weatherDesc
    NSArray *tempWeatherDesc = [self.transferArray valueForKey:@"hourly"];
    
    tempWeatherDesc = [tempWeatherDesc valueForKey:@"weatherDesc"];
    
    tempWeatherDesc = [tempWeatherDesc valueForKey:@"value"];
    tempWeatherDesc = [tempWeatherDesc objectAtIndex:0];
    tempWeatherDesc = [tempWeatherDesc objectAtIndex:0];
    
    self.weatherDesc.text = [NSString stringWithFormat:@"It's %@ ...",tempWeatherDesc];

    [self updateImage:[NSString stringWithFormat:@"%@",tempWeatherDesc]];
    
    //humidity
    NSArray *tempHumidity = [self.transferArray valueForKey:@"hourly"];
    
    tempHumidity = [tempHumidity valueForKey:@"humidity"];
    tempHumidity = [tempHumidity objectAtIndex:0];
    self.humiDity.text = [NSString stringWithFormat:@"%@%%",tempHumidity];
    
    
    //pressure
    
    NSArray *tempPressure = [self.transferArray valueForKey:@"hourly"];
    tempPressure = [tempPressure valueForKey:@"pressure"];
    tempPressure = [tempPressure objectAtIndex:0];
    self.pressure.text = [NSString stringWithFormat:@"%@ hPa",tempPressure];
    // NSLog(@"Temp pressure : %@",tempPressure);
    
    //cloudcover
    NSArray *tempCloudcover = [self.transferArray valueForKey:@"hourly"];
    tempCloudcover = [tempCloudcover valueForKey:@"cloudcover"];
    tempCloudcover = [tempCloudcover objectAtIndex:0];
    
    self.cloudCover.text = [NSString stringWithFormat:@"%@",tempCloudcover];
    
    
    //FeelsLikeC
    NSArray *tempFeelsLikeC = [self.transferArray valueForKey:@"hourly"];
    tempFeelsLikeC = [tempFeelsLikeC valueForKey:@"FeelsLikeC"];
    tempFeelsLikeC = [tempFeelsLikeC objectAtIndex:0];
   
    self.feelsLike.text = [NSString stringWithFormat:@"+%@°C",tempFeelsLikeC];
    
    
    //chanceofrain
    NSArray *tempChanceofrain = [self.transferArray valueForKey:@"hourly"];
    tempChanceofrain = [tempChanceofrain valueForKey:@"chanceofrain"];
    tempChanceofrain = [tempChanceofrain objectAtIndex:0];
   
    self.observationTime.text = [NSString stringWithFormat:@"%@",tempChanceofrain];

   

}

//Changes data according to date when button is clicked Left
- (IBAction)dateLeft:(id)sender {
    
    buttonCount--;
    
    
    switch (buttonCount) {
        case 0:
            [self updateButton:self.zerothArray];
            break;
        case 1:
            [self updateButton:self.firstArray];
            break;
        case 2:
            [self updateButton:self.secondArray];
            break;
        
        default:
            buttonCount++;
            break;
    }
    
}
//Changes data according to date when button is clicked Right
- (IBAction)dateRight:(id)sender {
    
    buttonCount++;
    
  
    
    switch (buttonCount) {
        case 0:
            [self updateButton:self.zerothArray];
            break;
        case 1:
            [self updateButton:self.firstArray];
            break;
        case 2:
            [self updateButton:self.secondArray];
            break;
            
        default:
            buttonCount--;
            break;
    }
}

//Changes location when button is clicked Left
- (IBAction)cityButtonLeft:(id)sender {
     placeCount--;
    
    NSLog(@"City Button Left Clock");
    
    if (placeCount < 0) {
        placeCount = self.cityNamesWithoutDuplicates.count;
        placeCount--;
    }
    
    [self getSession:[self.cityNamesWithoutDuplicates objectAtIndex:placeCount]];
    
}
//Changes location when button is clicked Right
- (IBAction)cityButtonright:(id)sender {
    
    NSLog(@"City Button Right Click");
    placeCount++;
    
    if (placeCount >= self.cityNamesWithoutDuplicates.count) {
        placeCount = 0;
    }
    
    [self getSession:[self.cityNamesWithoutDuplicates objectAtIndex:placeCount]];
    
}

-(void)updateButtonTemp{
    //FeelsLikeC
    NSArray *tempFeelsLikeC = [self.zerothArray valueForKey:@"maxtempC"];
    
    [self.zerothButtonOutlet setTitle:[NSString stringWithFormat:@"+%@°C",tempFeelsLikeC] forState:UIControlStateNormal];
    
    
    //FeelsLikeCC
    NSArray *tempFeelsLikeCC = [self.firstArray valueForKey:@"maxtempC"];
    
    [self.firstButtonOutlet setTitle:[NSString stringWithFormat:@"+%@°C",tempFeelsLikeCC] forState:UIControlStateNormal];
    
    
    //FeelsLikeCCC
    NSArray *tempFeelsLikeCCC = [self.secondArray valueForKey:@"maxtempC"];
    NSLog(@"Temp tempFeelsLikeCCC : %@",tempFeelsLikeCCC);
    
    [self.secondButtonOutlet setTitle:[NSString stringWithFormat:@"+%@°C",tempFeelsLikeCCC] forState:UIControlStateNormal];


}
- (IBAction)searchLocation:(id)sender {
    [self performSegueWithIdentifier:@"search" sender:self];
    
  //  searchController *serchClass = [[searchController alloc]init];
   // [serchClass setDelegate:self];
}



//Ctreates Delegates
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController* controller = [segue destinationViewController];
    if ([controller isKindOfClass:[searchController class]])
    {
        searchController* searchcontroller = (searchController *)controller;
        searchcontroller.delegate = self;
    }
}

-(void)setData:(NSString *)data{
    [self getSession:data];
    
}


//Date formatter to change the date format of API call results
-(void)dateFormatter : (int)buttonNumber : (NSString *)dateStr{


    NSString *myString = dateStr;
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSDate *myDate = [dateFormatter dateFromString:myString];
    dateFormatter.dateFormat = @"EEE, MMM d";
    NSLog(@"%@",[dateFormatter stringFromDate:myDate]);
    
    switch (buttonNumber) {
        case 1:
            self.firstDateLabel.text = [ NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:myDate] ];
            break;
        case 2:
            self.secondDateLabel.text = [ NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:myDate] ];
            break;
        case 3:
            self.thirdDateLabel.text = [ NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:myDate] ];
            break;
            
        default:
            break;
    }
}

//Changes the Background Image and Temprature Image according to cloud condition
-(void)updateImage : (NSString *)imageName{
    if ([imageName isEqualToString:@"Sunny"]) {
        self.tempImageView.image =[UIImage imageNamed:@"Sunny"];
        
        self.imageViewBack.image = [UIImage imageNamed:@"SunnyB"];
    }
    else if ([imageName isEqualToString:@"Partly Cloudy "]) {
        self.tempImageView.image =[UIImage imageNamed:@"Partly Cloudy"];
        self.imageViewBack.image = [UIImage imageNamed:@"Partly CloudyB"];
    }
    else if ([imageName isEqualToString:@"Cloudy "]) {
        self.tempImageView.image =[UIImage imageNamed:@"Cloudy"];
        self.imageViewBack.image = [UIImage imageNamed:@"CloudyB"];
    }
    else if ([imageName isEqualToString:@"Overcast "]) {
        self.tempImageView.image =[UIImage imageNamed:@"Overcast"];
         self.imageViewBack.image = [UIImage imageNamed:@"OvercastB"];
    }
    else if ([imageName isEqualToString:@"Patchy rain nearby"]) {
        self.tempImageView.image =[UIImage imageNamed:@"Patchy rain nearby"];
          self.imageViewBack.image = [UIImage imageNamed:@"Patchy rain nearbyB"];
    }
    else if ([imageName isEqualToString:@"Moderate or heavy rain shower"]) {
        self.tempImageView.image =[UIImage imageNamed:@"Moderate or heavy rain shower"];
        self.imageViewBack.image = [UIImage imageNamed:@"Moderate or heavy rain showerB"];
    }
    else if ([imageName isEqualToString:@"Light rain shower"]) {
        self.tempImageView.image =[UIImage imageNamed:@"Light rain shower"];
        self.imageViewBack.image = [UIImage imageNamed:@"Light rain showerB"];
    }
    else if ([imageName isEqualToString:@"Mist"]) {
        self.tempImageView.image =[UIImage imageNamed:@"Mist"];
        self.imageViewBack.image = [UIImage imageNamed:@"MistB"];
    }
    else if ([imageName isEqualToString:@"Light drizzle"]) {
        self.tempImageView.image =[UIImage imageNamed:@"Light drizzle"];
        self.imageViewBack.image = [UIImage imageNamed:@"Light drizzleB"];
    }
    else if ([imageName isEqualToString:@"Clear "]) {
        self.tempImageView.image =[UIImage imageNamed:@"Clear "];
         self.imageViewBack.image = [UIImage imageNamed:@"ClearB"];
    }
    else if ([imageName isEqualToString:@"Haze"]) {
        self.tempImageView.image =[UIImage imageNamed:@"HazeB"];
        self.imageViewBack.image = [UIImage imageNamed:@"Haze"];
    }
    else if ([imageName isEqualToString:@"Haze, Rain With Thunderstorm"]) {
        self.tempImageView.image =[UIImage imageNamed:@"Rain With Thunders"];
        self.imageViewBack.image = [UIImage imageNamed:@"Haze, Rain With Thunders"];
    }
    else if ([imageName isEqualToString:@"Haze, Rain Shower "]) {
        self.tempImageView.image =[UIImage imageNamed:@"Haze, Rain ShowerB"];
        self.imageViewBack.image = [UIImage imageNamed:@"Haze, Rain Shower"];
    }
    
    else {
        self.tempImageView.image =[UIImage imageNamed:@"Light rain"];
        self.imageViewBack.image = [UIImage imageNamed:@"Light rainB"];
    }
    
    
    
}

-(void)getCity:(NSMutableArray *)getCity{
    
    self.cityNamesWithoutDuplicates = [[self.cityNamesWithoutDuplicates arrayByAddingObjectsFromArray:getCity] mutableCopy];
NSSet *uniqueCities = [NSSet setWithArray:self.cityNamesWithoutDuplicates];
   self.cityNamesWithoutDuplicates=  [NSMutableArray arrayWithArray:[uniqueCities allObjects]];;

}

- (void)checkForNetworkConnection
{
    // check if we've got network connectivity
    Reachability *myNetwork = [Reachability reachabilityWithHostName:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    
    switch (myStatus) {
        case NotReachable:
            NSLog(@"There's no internet connection");
            break;
            
        case ReachableViaWWAN:
            NSLog(@"We have a 3G connection");
            [self viewDidLoadCustom];
            break;
            
        case ReachableViaWiFi:
            NSLog(@"We have WiFi.");
            [self viewDidLoadCustom];
            break;
            
        default:
            break;
    }
}
-(void)viewDidLoadCustom{

    placeCount = 0;
    
    //Initially takes Five Cityies to display when Button is clicked Left or Right
    self.cityNamesWithoutDuplicates = [[NSMutableArray alloc] initWithObjects:@"Bangalore",@"Delhi",@"Bombay",@"Chennai",@"Pune", nil];
    
    
    self.tempImageView.layer.cornerRadius = 5.0;
    self.tempImageView.clipsToBounds = YES;
    
    //Activity Indicator
    [self.activityIndicator startAnimating];
    
    self.urlString = [[NSString alloc]init];
    self.sendDelhiJson = [[NSString alloc]init];
    
    //JSON API Bangalore
    self.urlString = @"Bangalore";
    
    
    
    //Memory allocation
    self.performersArray2 = [[NSMutableArray alloc]init];
    self.jsonAPI = [[NSDictionary alloc]init];
    self.cityDetails = [[NSMutableArray alloc]init];
    self.cityTemp = [[NSMutableArray alloc]init];
    self.cityTempImage = [[NSMutableArray alloc]init];
    self.cityTempDate = [[NSMutableArray alloc]init];
    self.dateCuruent = [[NSArray alloc]init];
    
    //Creates Session
    [self getSession:self.urlString];
    
 

}
@end
