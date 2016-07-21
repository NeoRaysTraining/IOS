//
//  ViewController.m
//  StockExchangeApplicationDemo
//
//  Created by test on 7/18/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (strong,nonatomic) NSMutableArray *companynames,*companyNameList,*exchangeDetailsArray,*tickerSymbolArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.companynames =[NSMutableArray array];
    
}

-(void)settingDefaultValues
{
    [self.searchBarBtnOutlet setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark uisearchBar delegate methods
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSString *searchingCompanyString=[[NSString alloc]init ];
    searchingCompanyString=self.searchBarBtnOutlet.text;
    NSString *trimmed=[searchingCompanyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //NSLog(@"%@",searchingCompanyString);
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://d.yimg.com/aq/autoc?query=%@&region=IN&lang=en-US",trimmed]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //iNSLog(@"%@", json);
        self.companyNameList =[NSMutableArray array];
        self.exchangeDetailsArray =[NSMutableArray array];
        self.tickerSymbolArray =[NSMutableArray array];
        NSDictionary *result=[json valueForKey:@"ResultSet"];
        self.companynames =[result valueForKey:@"Result"];
        NSLog(@"%@",self.companynames);
        for (NSDictionary *dict in self.companynames) {
            [self.companyNameList addObject:[dict valueForKey:@"name"]];
            [self.exchangeDetailsArray addObject:[dict valueForKey:@"exch"]];
            [self.tickerSymbolArray addObject:[dict valueForKey:@"symbol"]];
            NSLog(@"%@",_tickerSymbolArray);
        }
        
        //[self.searchValueTableOutlet reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.searchValueTableOutlet reloadData];
        });
//
    }];
    
    
    [dataTask resume];
    

}


#pragma mark uitableview delegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.companyNameList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   
    NSLog(@"%@",[self.companyNameList objectAtIndex:indexPath.row]);
    cell.textLabel.text=[NSString stringWithFormat:@"%@", [self.companyNameList objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",[ self.exchangeDetailsArray objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *userInfo=[NSDictionary dictionaryWithObjectsAndKeys:[self.tickerSymbolArray objectAtIndex:indexPath.row],@"symbol", nil];
    NSLog(@"%@",userInfo);
    NSNotificationCenter *nc=[NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"sendDataBack" object:nil userInfo:userInfo];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
  }


@end
