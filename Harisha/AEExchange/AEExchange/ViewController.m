//
//  ViewController.m
//  AEExchange
//
//  Created by test on 6/15/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)disAgree:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.activityIndicator setHidden:YES];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.aeexchange.com/termsofservice.html"]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)agree:(id)sender
{
     [[NSUserDefaults standardUserDefaults] setValue:@"Agree" forKey:@"t&c"];
    [self performSegueWithIdentifier:@"homescene" sender:self];
}


- (IBAction)disAgree:(id)sender {
}

@end
