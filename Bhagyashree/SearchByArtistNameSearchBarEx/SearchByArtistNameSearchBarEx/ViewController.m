//
//  ViewController.m
//  SearchByArtistNameSearchBarEx
//
//  Created by test on 5/23/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (nonatomic,strong)NSMutableArray *artistArray;
@property (nonatomic,strong)NSMutableArray *searchResults;
@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;

@end

@implementation ViewController{
    NSManagedObject *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _artistArray = [[NSMutableArray alloc]init];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"]completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",json);
        
        NSArray *mainArray = [json valueForKey:@"results"];
        NSManagedObjectContext *context = [self getContext];
        for(NSDictionary *dict1 in mainArray)
        {
            NSManagedObject *file = [NSEntityDescription insertNewObjectForEntityForName:@"File" inManagedObjectContext:context];
            [file setValue:[dict1 valueForKey:@"artistName"] forKey:@"name"];
            [file setValue:[dict1 valueForKey:@"trackName"] forKey:@"track"];
            
            if ([context save:&error]) {
                NSLog(@"Data saved successfully");
                [self fetchData];
                [self.tableViewOutlet reloadData];
            }
            else
            {
                NSLog(@"Not saved");
            }
            
        }
        
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _searchResults.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    model = self.searchResults[indexPath.row];
    cell.textLabel.text=[model valueForKey:@"name"];
    cell.detailTextLabel.text=[model valueForKey:@"track"];
    
    return cell;
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = app.managedObjectContext;
    return context;
}

-(void) fetchData
{
    NSManagedObjectContext *context =[self getContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"File"];
    NSError *error =nil;
    _artistArray = [[NSMutableArray alloc]initWithArray:[context executeFetchRequest:request error:&error]];
    _searchResults=[NSMutableArray arrayWithArray:_artistArray];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length==0) {
        [_searchResults removeAllObjects];
        [_searchResults addObjectsFromArray:_artistArray];
    }
    else
    {
        [_searchResults removeAllObjects];
        for (model in _artistArray) {
            NSRange range = [[model valueForKey:@"name"] rangeOfString:searchText];
            if(range.location!=NSNotFound)
            {
                [_searchResults addObject:model];
            }
        }
    }
    [_tableViewOutlet reloadData];
}
@end
