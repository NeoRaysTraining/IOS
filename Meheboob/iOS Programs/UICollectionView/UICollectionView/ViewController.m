//
//  ViewController.m
//  UICollectionView
//
//  Created by test on 29/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell2.h"

@interface ViewController ()

@end

@implementation ViewController{

    int sendRow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.countryNames = [[NSArray alloc]initWithObjects:@"India",@"USA",@"UK",@"Sri Lanka", nil ];
    
    
    self.placeImages = [[NSArray alloc]initWithObjects:@"IGhataprabha bird sanctuary",@"IGokak False",@"IVijayanagar Hampi",@"IHalebidu Temple",@"IBadami Cave Temples",@"IKudroli Gokarnath Temple",@"IGol Gumbaz",@"IVisvesvaraya Industrial and Technological Museum",@"ILalbagh Botanical Garden",@"IGodchinamalaki Falls", nil];
    
//    self.placeNames = [[NSArray alloc]initWithObjects:@"Ghataprabha birds sanctuary",@"Gokak Falls",@"Vijayanagar Hampi",@"Halebidu Temple",@"Badami Cave Temples",@"Kudroli Gokarnath Temple",@"Gol Gumbaz",@"Visvesvaraya Technological Museum",@"Lalbagh Botanical Garden",@"Godchinamalaki Falls", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.placeImages count];

}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //cell.labelField.text = [self.countryNames objectAtIndex:indexPath.row];
    
    
    cell.imageField.image = [UIImage imageNamed:[self.placeImages objectAtIndex:indexPath.row]];
    cell.imageField.layer.cornerRadius = 20.0;
    cell.imageField.layer.masksToBounds = YES;
    
    sendRow=  (int)indexPath.row;
    
    NSLog(@"the send row is : %i",sendRow);
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    sendRow=  (int)indexPath.row;
    
    NSLog(@"the send row is : %i",sendRow);
    
    [self performSegueWithIdentifier:@"next" sender:self];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ViewController2 *Vc2 =  [segue destinationViewController];
    
    [Vc2 getRoow:sendRow];
}


@end
