//
//  ViewController.m
//  DisplayingAchievementsOfPeopleByClickingOnTheirImaages
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ShowDetailsViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;
@property (strong, nonatomic) IBOutlet UIImageView *img4;


@property (assign,nonatomic) int i;

@end

@implementation ViewController
- (IBAction)image2Action:(id)sender {
    
    self.i=22;
    [self performSegueWithIdentifier:@"showDetails" sender:self];

}
- (IBAction)image1Action:(id)sender {
    
    //NSLog(@"sachin");
    self.i=11;
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}
- (IBAction)image3Action:(id)sender {
    self.i=33;
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}
- (IBAction)image4Action:(id)sender {
    self.i=44;
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ShowDetailsViewController *vc=[segue destinationViewController];
    
    [vc displayPersonDetails:self.i];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.img1.image=[UIImage imageNamed:@"sachin"];
    self.img2.image=[UIImage imageNamed:@"apj"];
    self.img3.image=[UIImage imageNamed:@"sirmv"];
    self.img4.image=[UIImage imageNamed:@"swami"];
    
    self.i=0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
