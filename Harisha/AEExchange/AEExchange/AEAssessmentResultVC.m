//
//  AEAssessmentResultVC.m
//  AEExchange
//
//  Created by test on 6/18/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "AEAssessmentResultVC.h"

@interface AEAssessmentResultVC ()
- (IBAction)produceCommLetter:(id)sender;

@end

@implementation AEAssessmentResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.automaticallyAdjustsScrollViewInsets=YES;
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

- (IBAction)produceCommLetter:(id)sender
{
    [self performSegueWithIdentifier:@"letterDetails" sender:self];
}

@end
