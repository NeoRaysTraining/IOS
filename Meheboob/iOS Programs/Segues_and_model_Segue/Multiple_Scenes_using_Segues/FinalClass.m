//
//  FinalClass.m
//  Multiple_Scenes_using_Segues
//
//  Created by test on 20/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "FinalClass.h"

@interface FinalClass ()

@end

@implementation FinalClass

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
//- (IBAction)Dobe:(id)sender {
//    
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//}


- (IBAction)Done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
