//
//  ViewController2.m
//  WeatherApp
//
//  Created by test on 6/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorOutlet;

@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;
@property (nonatomic,strong) NSDictionary *json;
@property (nonatomic,strong) NSMutableArray *cityNameArray;
@property (nonatomic,strong) NSMutableArray *countryNameArray;
@property (nonatomic,strong) NSString *searchStr;
@property (nonatomic,strong) NSMutableArray *searchCities;
@property (nonatomic,strong) NSArray *arrayWithoutDuplicates;
@property (nonatomic,strong) NSString *cityNameStr;
@property (nonatomic,strong) NSString *enteredStr;
@property(nonatomic,strong) NSString* msg;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_activityIndicatorOutlet setHidden:YES];
    
    _searchCities=[[NSMutableArray alloc]init];
    _arrayWithoutDuplicates=[[NSArray alloc]init];
    
    _cityNameArray=[[NSMutableArray alloc]init];
    self.countryNameArray = [[NSMutableArray alloc]init];
}


-(void)changeUrl:(NSString*)changeStr
{
    NSLog(@"string recived is :%@",changeStr);
    
    NSString *urlStr =@"http://api.worldweatheronline.com/premium/v1/search.ashx?key=a6806d269e4a4bf79e360847160406&q=Str&format=json";
    
    NSString* str = [urlStr stringByReplacingOccurrencesOfString:@"Str" withString:changeStr];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:str]completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        _json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       //   NSLog(@"%@",_json);
        
        NSArray* array1 = [_json valueForKey:@"data"];
      //  NSLog(@"%@",array1);
        
        if([array1 valueForKey:@"error"])
        {
            NSLog(@"error occured");
            
            NSArray* msgArray=[array1 valueForKey:@"error"];
            for(NSDictionary* msgDict in msgArray)
            {
                _msg=[msgDict valueForKey:@"msg"];
                NSLog(@"%@",_msg);
            }
            
            [self callAlert];
        }
        else
        {
        [self fetchAreaName];
        [self fetchCountryName];
        [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
        }
            
        [_activityIndicatorOutlet stopAnimating];
        [_activityIndicatorOutlet hidesWhenStopped];
    }];
    [dataTask resume];
}

-(void)reloadData
{
    [_tableViewOutlet reloadData];
}

-(void)callAlert
{
    NSLog(@"in call alert");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert Message" message:_msg preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)fetchAreaName
{
    _cityNameArray=[[NSMutableArray alloc]init];
    
    NSArray* searchApiArray = [_json objectForKey:@"search_api"];
    //  NSLog(@"%@",searchApiArray);
    searchApiArray = [searchApiArray valueForKey:@"result"];
    searchApiArray = [searchApiArray valueForKey:@"areaName"];
    
    for (NSDictionary *areaDict in searchApiArray) {
        for (NSString *city in [areaDict valueForKey:@"value"]) {
            [self.cityNameArray addObject:city];
            NSLog(@"%@",city);
        }
    }
    NSLog(@"All City Names: %@",self.cityNameArray);
}

-(void)fetchCountryName
{
    _countryNameArray=[[NSMutableArray alloc]init];
    
    NSArray *searchApiArray = [_json objectForKey:@"search_api"];
   // NSLog(@"%@",searchApiArray);
    searchApiArray = [searchApiArray valueForKey:@"result"];
    searchApiArray = [searchApiArray valueForKey:@"country"];
    
   // NSLog(@" country : %@",searchApiArray);
    for(NSDictionary *countryDict in searchApiArray)
    {
       // NSLog(@"%@",countryDict);
        for(NSArray* countArray in countryDict)
        {
           //NSLog(@"%@",countArray);
            NSString* countryName = [countArray valueForKey:@"value"];
            NSLog(@"%@",countryName);
            [_countryNameArray addObject:countryName];
        }
    }
    NSLog(@"country array is : %@",_countryNameArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cityNameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text=self.cityNameArray[indexPath.row];
    cell.detailTextLabel.text=self.countryNameArray[indexPath.row];
    return cell;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    _searchStr=searchBar.text;
    NSLog(@"search string is : %@",_searchStr);
    [self changeUrl:_searchStr];
    [_activityIndicatorOutlet setHidden:NO];
    [_activityIndicatorOutlet startAnimating];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    _cityNameStr = cell.textLabel.text;
    NSLog(@"%@",_cityNameStr);
    [self.delegate setData:_cityNameStr];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)setData:(NSString*)data
{
    [self.delegate setData:data];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
