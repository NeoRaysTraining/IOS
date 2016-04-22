//
//  ThirdViewController.m
//  UITabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ThirdViewController.h"
#import "CustomSingleTon.h"
@interface ThirdViewController ()
@property NSString *saveValue;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

self.imageViewDisplay.image=[UIImage imageNamed:@"One"];


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


- (IBAction)SaveButton:(id)sender
{

CustomSingleTon* sharedInstance=[CustomSingleTon instance ];

    
    [sharedInstance setInfo:@"second"];
    self.imageViewDisplay.image=[UIImage imageNamed:@"Two"];
    self.saveValue=[sharedInstance getInfo];




}

- (IBAction)LoadButton:(id)sender
{

   

   self.imageViewDisplay.image=[UIImage imageNamed:@"Three"];

   self.messageDisplayLabel.text=[NSString stringWithFormat:@" All The Images Loaded Succesfully %@",self.saveValue];

}


@end
