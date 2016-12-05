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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.contentOffsetDictionary = [NSMutableDictionary dictionary];
    self.productArray=@[@{
        @"first" : @[@"1",@"2",@"3",@"4",@"5",@"6"]
    },
        @{
        @"second" : @[@"11",@"22",@"33"]
        },
                        ];
    
    //self.productArray=@[@"1",@"2",@"3",@"4",@"5",@"6"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.productArray count];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

#pragma mark collectionview delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //NSArray *collectionViewArray = [self.productArray[[(AFIndexedCollectionView *)collectionView ] valueForKey:[[[self.productArray objectAtIndex:section] allKeys] objectAtIndex:0]];
    NSArray *collectionViewArray=[[self.productArray objectAtIndex:section] valueForKey:[[[self.productArray objectAtIndex:section] allKeys] objectAtIndex:0]];
    return collectionViewArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    @try {
        
        //NSArray *collectionViewArray =[[self.productArray objectAtIndex:indexPath.row] valueForKey:[[[self.productArray objectAtIndex:indexPath.row] allKeys] objectAtIndex:0]];
        NSArray *collectionViewArray = [self.productArray[[(AFIndexedCollectionView *)collectionView indexPath].row] valueForKey:[[[self.productArray objectAtIndex:indexPath.row] allKeys] objectAtIndex:0]];
        cell.itemLbl.text = [NSString stringWithFormat:@"%@",collectionViewArray[indexPath.row]];
        
    } @catch (NSException *exception) {
        
    }
    
    
    //[self.productArray[[(AFIndexedCollectionView *)collectionView indexPath].row] valueForKey:[[[self.productArray objectAtIndex:indexPath.row] allKeys] objectAtIndex:0]];
    
    
    
    return cell;
}

//#pragma mark - UIScrollViewDelegate Methods
//
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if (![scrollView isKindOfClass:[UICollectionView class]]) return;
//    
//    CGFloat horizontalOffset = scrollView.contentOffset.x;
//    
//    AFIndexedCollectionView *collectionView = (AFIndexedCollectionView *)scrollView;
//    NSInteger index = collectionView.indexPath.row;
//    self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
//}




@end
