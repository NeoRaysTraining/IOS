//
//  ViewController.m
//  CollectionViewDisplayVisitingPlc
//
//  Created by test on 4/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "ViewController2.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) NSArray* plcNames;
@property (nonatomic,strong) NSArray* imgNames;
@property long itemNo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _plcNames=@[@"Banglore Palace",@"Wonder-la",@"Vidhan Soudha",@"Lal bhag"];
    _imgNames=@[@"blrpalace",@"wondela",@"vidhansoudha",@"lalbhag"];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _plcNames.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.placeLbl.text=self.plcNames[indexPath.row];
    cell.imgView.image=[UIImage imageNamed:_imgNames[indexPath.row]];
    cell.imgView.layer.cornerRadius=10;
    cell.imgView.clipsToBounds=YES;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _itemNo=indexPath.row;
    [self performSegueWithIdentifier:@"Segue1" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC2 = [segue destinationViewController];
    [VC2 receiveData:self.plcNames:self.imgNames:self.itemNo];
    
}

@end
