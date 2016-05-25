//
//  ViewController.m
//  SearchIFoodItemsByusingSearchBar
//
//  Created by test on 5/24/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "TabelViewCell.h"
#import "ViewController2.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;
@property(nonatomic,strong)NSMutableArray *differentFoodItems;
@property(nonatomic,strong)NSMutableArray *differentFoodImages;
@property (nonatomic,strong)NSMutableArray *searchResults;
@property int storedValue;

@property (weak, nonatomic) IBOutlet UITableView *tabelView;

@property BOOL isFiltered;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.differentFoodImages=[[NSMutableArray alloc]initWithObjects:@"Bhel",@"Dosa",@"Gobi",@"Jamoon",@"Burger",@"Panipuri",@"Parota",@"Pulav",@"Roti",@"Samosa",@"Myspak",@"Holige",@"Mash",nil];

self.differentFoodItems=[[NSMutableArray alloc]initWithObjects:@"Bhel",@"Dosa",@"Gobi",@"Jamoon",@"Burger",@"Panipuri",@"Parota",@"Pulav",@"Roti",@"Samosa",@"Myspak",@"Holige",@"Mash",nil];

    self.searchResults=self.differentFoodItems;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.searchResults.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TabelViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.displayLabel.text=self.searchResults[indexPath.row];
    cell.imageViewDisplay.image=[UIImage imageNamed:self.searchResults [indexPath.row]];
    
    return cell;
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
   
    if(searchText.length==0)
    {
        self.isFiltered=NO;
    } else
    {
        self.isFiltered=YES;
        
        self.searchResults = [[NSMutableArray alloc]init];
        for (NSString* str in self.differentFoodImages)
        {
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if(stringRange.location != NSNotFound)
            {
                [self.searchResults addObject:str];
                
            }
        }
      
    }
    
    [self.tabelView reloadData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.storedValue=(int)indexPath.row;
    [self performSegueWithIdentifier:@"scene2" sender:self];
    

    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    ViewController2 *vc2=[segue destinationViewController];
    [vc2  receivedData:self.storedValue];
    
}





@end
