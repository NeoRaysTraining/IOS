//
//  ViewController.m
//  CollectionViewInsideTableViewCellDemo
//
//  Created by test on 12/5/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSArray *productArray;

@property (nonatomic, strong) NSMutableDictionary *contentOffsetDictionary;
@property (strong, nonatomic) IBOutlet UITableView *tableViewOutlet;

@property (strong,nonatomic) NSMutableArray *ElemetsTopopulate;
@end

@implementation ViewController{
    NSArray *collectionViewArray,*techicalArray;
    NSMutableArray *arIndex;
    int i;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.ElemetsTopopulate=[[NSMutableArray alloc]init];
    arIndex=[[NSMutableArray alloc]init];
    i=0;
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
    NSArray *first=@[@"1",@"2",@"3",@"4",@"5",@"6",@"1",@"2",@"3",@"4",@"5",@"6"];
    NSArray *second=@[@"11",@"22",@"33"];
    NSArray *third=@[@"111",@"222",@"333"];
    self.productArray=[[NSArray alloc]initWithObjects:first,second,third, nil];
    NSLog(@"%lu",(unsigned long)[self.productArray count]);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark tableviewDelegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.productArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"tableCell";
    
    CustomTableViewCell *tableCell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (!tableCell)
    {
        
        tableCell=[[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }

    return tableCell;
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(CustomTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setCollectionViewDataSourceDelegate:(id)self indexPath:indexPath];
    NSInteger index = cell.collectionViewOutlet.indexPath.row;


    CGFloat horizontalOffset = [self.contentOffsetDictionary[[@(index) stringValue]] floatValue];
    [cell.collectionViewOutlet setContentOffset:CGPointMake(horizontalOffset, 0)];
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}

#pragma mark collectionview delegate


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return [[self.productArray objectAtIndex:section] count];
    collectionViewArray = self.productArray[[(AFIndexedCollectionView *)collectionView indexPath].row];
    return [collectionViewArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];

    
    @try {
        collectionViewArray = self.productArray[[(AFIndexedCollectionView *)collectionView indexPath].row];
        cell.itemLbl.text = [NSString stringWithFormat:@"%@",collectionViewArray[indexPath.item]];

        
    } @catch (NSException *exception) {
        
    }
    
    
    return cell;
}

#pragma mark - UIScrollViewDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    AFIndexedCollectionView *collectionView = (AFIndexedCollectionView *)scrollView;
    NSInteger index = collectionView.indexPath.row;
    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}




@end
