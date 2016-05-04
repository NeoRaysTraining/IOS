//
//  ViewController.m
//  UICollerctionViewDemo3
//
//  Created by test on 5/4/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "CollerctionViewCell.h"
#import "ViewController2.h"
@interface ViewController ()
@property (nonatomic,assign)int getValue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

self.differentCricketTeams=[[NSArray  alloc]initWithObjects:@"MI",@"KKR"@"RCB",@"DD",@"PuneWarriors",@"GujaratLions",@"KXP",@"sunrisesHyd", nil];
   
self.differentCricketTeamImages=[[NSArray alloc]initWithObjects:@"hyd",@"kkr",@"rcb",@"dd",@"pwr",@"gujurat",@"punj",@"mi",nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

  
    return self.differentCricketTeams.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollerctionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
  
    cell.iplTeamimageView.image=[UIImage imageNamed:self.differentCricketTeamImages[indexPath.row]];
   
    
   
    return cell;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  self.g

    [self performSegueWithIdentifier:@"scene2" sender:self];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{


    ViewController2 *vc2=[segue destinationViewController];
    [vc2 receivedlImages:self.differentCricketTeams];
}





@end
