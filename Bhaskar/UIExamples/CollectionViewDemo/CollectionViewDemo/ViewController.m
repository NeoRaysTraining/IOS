//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by test on 4/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "ViewController2.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic,strong) NSArray *topicsName,*topicImages;

@property (nonatomic,strong) NSString *selectedTopic;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.topicsName=[[NSArray alloc]initWithObjects:@"Nature",@"Science",@"Mathematics",@"Sports",@"Books", nil];
    self.topicImages=[[NSArray alloc]initWithObjects:@"nature",@"science",@"maths",@"sports",@"books", nil];
    
    //NSLog(@"%@",_topicsName);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.topicsName.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.topicNameLbl.text=self.topicsName[indexPath.row];
    
    cell.imgView.image=[UIImage imageNamed:self.topicImages[indexPath.row]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedTopic=[self.topicsName objectAtIndex: indexPath.row];
    [self performSegueWithIdentifier:@"particularDetails" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *vc=[segue destinationViewController];
    [vc receiveTopicDetails:self.selectedTopic];
}
@end
