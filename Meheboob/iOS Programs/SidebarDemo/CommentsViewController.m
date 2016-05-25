//
//  CommentsViewController.m
//  SidebarDemo
//
//  Created by Mahaboobsab Nadaf on 25/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController ()

@end

@implementation CommentsViewController
@synthesize sidebarButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myTextView.text = @"Neo Rays is a pioneer in the IT Staff Augmentation industry. We bridge the IT talent demand-supply gap through an innovative, best-in-class recruiting engine, backed by a dedicated client-centric service. We are also known for providing the best staffing experience and taking great care of our clients and employees. We offer staff augmentation with various placement models. Our client-centric model provides focus, commitment and a dedicated team to help our clients achieve their business objectives.";
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
