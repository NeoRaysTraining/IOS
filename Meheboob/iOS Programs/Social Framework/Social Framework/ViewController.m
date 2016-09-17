//
//  ViewController.m
//  Social Framework
//
//  Created by Mahaboobsab Nadaf on 17/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postOnTwitter:(id)sender {
    
    SLComposeViewController*tweetter=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [tweetter setInitialText:@"Ufffffff"];
    [self presentViewController:tweetter animated:YES completion:nil];

}

- (IBAction)postOnFacebook:(id)sender {
    
    //SLServiceTypeFacebook
    
    
//        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
//        
//        [controller setInitialText:@"Uffffffffffffffff"];
//        [self presentViewController:controller animated:YES completion:Nil];
//
    
    SLComposeViewController*post=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [post setInitialText:@"Uffffffffffffffff"];
    //[post addImage:[UIImage imageNamed:@"Unknown.jpg"]];
   // [post addURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.gmail.com"]] ];
    [self presentViewController:post animated:YES completion:nil];

}
@end
