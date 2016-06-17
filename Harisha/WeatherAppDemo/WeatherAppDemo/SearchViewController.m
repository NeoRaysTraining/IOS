//
//  SearchViewController.m
//  WeatherAppDemo
//
//  Created by test on 6/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "SearchViewController.h"
#import "ViewController.h"
#import "CollectionViewCell.h"

@interface SearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)NSArray* json;
@property(strong,nonatomic)NSArray* jsonArray;
@property(strong,nonatomic)NSArray* areaValue;
@property(strong,nonatomic)NSString* selectedArea;
@property(strong,nonatomic)NSDictionary* SelectedAreaDict;

@end

@implementation SearchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
    {
        NSString* newUrl = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/search.ashx?key=a3ce7967a5ff4216bd555247160406&q=%@&format=json",searchBar.text];
        
        NSLog(@"the new url %@",newUrl);
        NSURLSession* session = [NSURLSession sharedSession];
        NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:newUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
                                          {
                                              self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                              // NSLog(@"%@",json);
                                              
        self.jsonArray = [self.json valueForKey:@"search_api"];
        NSLog(@"value is %@",self.jsonArray);
                                              
        NSArray* searchResult = [self.jsonArray valueForKey:@"result"];
        NSLog(@"search result %@",searchResult);
                                              
        NSArray* areaname = [searchResult valueForKey:@"areaName"];
        
            NSLog(@"arae names are %@",areaname);
       self.areaValue = [areaname valueForKey:@"value"];
        NSLog(@"area names %@",[self.areaValue componentsJoinedByString:@""]);
        [self.tableView reloadData];
   
    }];
        [dataTask resume];
         [searchBar resignFirstResponder];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"The value is %ld",self.areaValue.count);
    return self.areaValue.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
   UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSLog(@"table cell value is %@",[self.areaValue componentsJoinedByString:@""]);
    cell.textLabel.text = [self.areaValue[indexPath.row]componentsJoinedByString:@""];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    
    self.selectedArea = selectedCell.textLabel.text;
    
    self.SelectedAreaDict = [NSDictionary dictionaryWithObject:self.selectedArea forKey:@"location"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"citiesListComplete" object:nil userInfo:self.SelectedAreaDict];
    
    [self.tableView setHidden:YES];
    
    //[self dismissViewControllerAnimated:YES completion:nil];

    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}




@end
