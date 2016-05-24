//
//  ViewController.m
//  SearchBarApp
//
//  Created by test on 5/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (nonatomic,strong) NSArray *places;
@property (nonatomic,strong) NSMutableArray *searchResults;
@property (weak, nonatomic) IBOutlet UISearchBar *searchItem;
@property (weak, nonatomic) IBOutlet UITableView *tableViewOut;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _places=@[@"Bengaluru",@"Mysore",@"Bagalkote",@"Gulbarga",@"Belagavi",@"Raichur",@"Hubli",@"Dharwad",@"Gadag"];
    
    self.searchResults = [NSMutableArray arrayWithArray:_places];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResults.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=_searchResults[indexPath.row];
    return cell;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"Cancel clicked");
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length==0) {
        [_searchResults removeAllObjects];
        [_searchResults addObjectsFromArray:_places];
    }
    else
    {
        [_searchResults removeAllObjects];
        for (NSString* cmprTxt in _places) {
            NSRange range = [cmprTxt rangeOfString:searchText];
            if(range.location!=NSNotFound)
            {
                [_searchResults addObject:cmprTxt];
            }
        }
    }
    [_tableViewOut reloadData];
    
}

@end
