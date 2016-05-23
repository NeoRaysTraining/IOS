//
//  ViewController.m
//  UISearchBarWithNSURLSession
//
//  Created by test on 5/23/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic,strong) NSDictionary *jsonDict;

@property (nonatomic,strong) NSMutableArray *modelArray,*displayArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.modelArray=[[NSMutableArray alloc]init];
    
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"] completionHandler:^(NSData * data, NSURLResponse *response, NSError *error) {
        NSError *errorParsing=nil;
        if (error==nil) {
            self.jsonDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&errorParsing];
            if (errorParsing==nil) {
                //NSLog(@"%@",self.jsonDict);
                
                NSArray *arr=[_jsonDict valueForKey:@"results"];
                
                for (NSDictionary *dict in arr) {
                    
                    Model *model=[[Model alloc]initWithArtistName:[dict valueForKey:@"artistName"] trackName:[dict valueForKey:@"trackName"]];
                    
                    [self.modelArray addObject:model];
                    
                }
                
                self.displayArray=[[NSMutableArray alloc]initWithArray:_modelArray];
                
            }
        }
        [self.tableView reloadData];
    }];
    [dataTask resume];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.displayArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Model *model=[self.displayArray objectAtIndex:indexPath.row];
    cell.textLabel.text=model.aName;
    cell.detailTextLabel.text=model.tName;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length==0) {
        [self.displayArray removeAllObjects];
        [self.displayArray addObjectsFromArray:_modelArray];
    }
    else
    {
        //removing all objects from the array before searching
        [self.displayArray removeAllObjects];
        
        
        //extracting each model object from modelArray
        for (Model *m in self.modelArray) {
            
        
                //comparing artist name with the searchText field
                NSRange r=[m.aName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            
                if (r.location!=NSNotFound) {
                    //if found adding model object to the display array
                    [self.displayArray addObject:m];
                }
                
            

        }
                //NSLog(@"element found");
    }
    
    //reloading table view
    [self.tableView reloadData];
}

@end
