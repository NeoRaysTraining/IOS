//
//  ViewController.m
//  UICollerctionView
//
//  Created by test on 4/29/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
@interface ViewController ()

@property (nonatomic,strong) NSArray *differentflowerImages;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typicallyfrom a nib.
    self.differentflowerImages=[[NSArray alloc]initWithObjects:@"flower1",@"flower2",@"flower3",@"flower4",@"flower5",@"flower6",@"flower7",@"flower8",nil];
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{

    return self.differentflowerImages.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
  
    cell.imageViewDisplay.image=[UIImage imageNamed:self.differentflowerImages [indexPath.row]];

    cell.imageViewDisplay.layer.cornerRadius=50.0;
    cell.imageViewDisplay.layer.masksToBounds=true;
    
  return  cell;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{



    [self performSegueWithIdentifier:@"scene2" sender:self];
}
@end
