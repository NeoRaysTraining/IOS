//
//  ViewController2.m
//  DisplayingDetailsByClickingOnCell
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@property (strong,nonatomic) NSArray *foodNames, *foodImages,*descriptionOfFood;

@property (strong, nonatomic) IBOutlet UIImageView *foodimg;

@property (strong, nonatomic) IBOutlet UILabel *foodDescriptionLabel;

@property (assign,nonatomic) int i;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.foodNames=[[NSArray alloc]initWithObjects:@"Idly",@"Vada",@"Dosa",@"oats", nil];
    self.foodImages=[[NSArray alloc]initWithObjects:@"idly",@"vada",@"dosa",@"oats", nil];
    
    self.descriptionOfFood=[[NSArray alloc]initWithObjects:@"is a traditional breakfast in South Indian households. Idli is a savoury cake that is popular throughout India and neighbouring countries like Sri Lanka",@"s a common term for many different types of savoury fried snacks from India.",@"Dosa is indigenous to South India; its exact birthplace in that region is a matter of conjecture",@"Oatmeal is made of oat groats (i.e. grains) that have either been ground, crushed, steel-cut, or rolled. Ground oats are also called white oats", nil];
    
    self.foodimg.image=[UIImage imageNamed:[_foodImages objectAtIndex:self.i]];
    
    self.foodDescriptionLabel.text=[_descriptionOfFood objectAtIndex:self.i];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)receiveData:(int)foodNumber
{
    self.i=foodNumber;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
