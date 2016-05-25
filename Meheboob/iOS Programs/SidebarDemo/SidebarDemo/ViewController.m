//
//  ViewController.m
//  SidebarDemo
//
//  Created by Mahaboobsab Nadaf on 25/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if (revealViewController) {
        
        [self.sidebarButton setTarget:self.revealViewController];
        
        [self.sidebarButton setAction:@selector(revealToggle:)];
        
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sidebarButton:(id)sender {
}
@end
