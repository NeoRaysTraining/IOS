//
//  ViewController.m
//  JsonDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray* nameArray;
@property (nonatomic,strong)NSMutableArray* idArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _nameArray=[[NSMutableArray alloc]init];
    _idArray =[[NSMutableArray alloc]init];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *datatask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"] completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",json);
    
     
        NSArray *mainArray1 =[json objectForKey:@"results"];
        for(NSDictionary *dic1 in mainArray1)
        {
            [self.nameArray addObject:[dic1 objectForKey:@"artistName"]];
            
            NSLog(@"%@",_nameArray);
        }
        
        NSArray *mainArray2 = [json objectForKey:@"results"];
        for(NSDictionary *dic2 in mainArray2)
        {
            [self.idArray addObject:[dic2 objectForKey:@"artistId"]];
            NSLog(@"%@",_idArray);
        }
        [self.tableViewOutlet reloadData];
        
    }];
    
    [datatask resume];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",_nameArray[indexPath.row]];
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",_idArray[indexPath.row]];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
