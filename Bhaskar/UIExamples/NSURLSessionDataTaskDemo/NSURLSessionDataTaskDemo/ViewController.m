//
//  ViewController.m
//  NSURLSessionDataTaskDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,strong) NSDictionary *jsonDict;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.activityIndicator startAnimating];
    self.modelArray=[[NSMutableArray alloc]init];
    
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"] completionHandler:^(NSData * data, NSURLResponse *response, NSError *error) {
        NSError *errorParsing=nil;
        if (error==nil) {
            self.jsonDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&errorParsing];
            if (errorParsing==nil) {
                 //NSLog(@"%@",self.jsonDict);
                
                NSArray *arr=[_jsonDict valueForKey:@"results"];
                //NSLog(@"%@",arr);
                
                for (NSDictionary *dict in arr) {
                    //NSLog(@"%@,%@",[dict valueForKey:@"artistName"],[dict valueForKey:@"trackName"]);
                    Model *model=[[Model alloc]initWithName:[dict valueForKey:@"artistName"]trackName:[dict valueForKey:@"trackName"]];
                    [self.modelArray addObject:model];
                    
                }
            }
           
        }
        
        [self.activityIndicator stopAnimating];
        [self.activityIndicator setHidden:YES];

        [self.tableView reloadData];
    }];
    
    [dataTask resume];
                
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.modelArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Model *model=[self.modelArray objectAtIndex:indexPath.row ];
    cell.textLabel.text=model.name;
    cell.detailTextLabel.text=model.track;

    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
