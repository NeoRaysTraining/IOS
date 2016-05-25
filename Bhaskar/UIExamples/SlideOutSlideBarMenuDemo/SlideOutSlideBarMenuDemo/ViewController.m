//
//  ViewController.m
//  SlideOutSlideBarMenuDemo
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sideBarButton.target=self.revealViewController;
    self.sideBarButton.action=@selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
