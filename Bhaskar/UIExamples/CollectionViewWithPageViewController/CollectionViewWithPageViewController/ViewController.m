//
//  ViewController.m
//  CollectionViewWithPageViewController
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "DescriptionViewController.h"
#import "AppDelegate.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,assign) int selectedProduct;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.images=[[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.images count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imgView.image=[UIImage imageNamed:self.images[indexPath.row]];
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedProduct=(int)indexPath.row;
    NSLog(@"%d",_selectedProduct);
    
    [self performSegueWithIdentifier:@"productDescription" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DescriptionViewController *vc=[segue destinationViewController];
    [vc receiveItem:self.selectedProduct];
}
@end
