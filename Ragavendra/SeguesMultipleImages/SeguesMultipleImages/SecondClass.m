//
//  SecondClass.m
//  SeguesMultipleImages
//
//  Created by test on 4/21/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "SecondClass.h"

@interface SecondClass ()

@end

@implementation SecondClass

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   
    [self performSegueWithIdentifier:@"SecondScene" sender:self];
    

    
    self.secondPictureDisplay.image=[UIImage imageNamed:@"sir MV"];

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

@end
