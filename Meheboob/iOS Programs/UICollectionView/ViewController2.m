//
//  ViewController2.m
//  UICollectionView
//
//  Created by test on 29/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
{
    int recievdRow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.allImages = [[NSArray alloc]initWithObjects:@"IGhataprabha bird sanctuary",@"IGokak False",@"IVijayanagar Hampi",@"IHalebidu Temple",@"IBadami Cave Temples",@"IKudroli Gokarnath Temple",@"IGol Gumbaz",@"IVisvesvaraya Industrial and Technological Museum",@"ILalbagh Botanical Garden",@"IGodchinamalaki Falls", nil];
    
    self.imagefield.image = [UIImage imageNamed:[self.allImages objectAtIndex:recievdRow]];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)getRoow : (int)rownumber{
    recievdRow = rownumber;
    

}
@end
