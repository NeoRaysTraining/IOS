//
//  TermsAgree.m
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 16/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "TermsAgree.h"

@interface TermsAgree ()

@end

@implementation TermsAgree

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.activityIndicator startAnimating];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.aeexchange.com/termsofservice.html"]]];
    
    [self.activityIndicator stopAnimating];
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

- (IBAction)agreeButton:(id)sender {
    
    [self performSegueWithIdentifier:@"main" sender:self];
}
@end
