//
//  ViewController.m
//  UISearchBar
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (nonatomic,strong) NSArray *allItems;

@property (nonatomic,strong)NSMutableArray *displayItems;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.allItems=[[NSArray alloc]initWithObjects:@"Bhaskar",@"Harish",@"Raghavendra",@"Nadaf",@"Sagar",@"Sameer",@"Khadeer",@"Mahima",@"BhagyaShree",@"Archana",nil];
    
    self.displayItems=[[NSMutableArray alloc]initWithArray:self.allItems];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideKeyBoard:) name:UIKeyboardDidShowNotification object:nil];
}


-(void)keyboardShown:(NSNotification*)note
{
    CGRect keyBoardFrame;
    [[[note userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey]getValue:&keyBoardFrame];
    CGRect tableViewFrame=self.tableView.frame;
    tableViewFrame.size.height-=keyBoardFrame.size.height;
    [self.tableView setFrame:tableViewFrame];
}

-(void)hideKeyBoard:(NSNotification*)note
{
    [self.tableView setFrame:self.view.bounds];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.displayItems count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=self.displayItems[indexPath.row];
    return cell;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText length]==0) {
        [self.displayItems removeAllObjects];
        [self.displayItems addObjectsFromArray:self.allItems];
    }
    else
    {
        [self.displayItems removeAllObjects];
        for (NSString *str in self.allItems) {
            NSRange r=[str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (r.location!=NSNotFound) {
                [self.displayItems addObject:str];
            }
        }
    }
    [self.tableView reloadData];
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
@end
