//
//  ViewController.m
//  WebViewDemo
//
//  Created by test on 4/21/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityAnim;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = @"http://www.apple.com";
    NSURL *url = [NSURL URLWithString:urlString];
    //Without using any browser
   // NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
  //  [_webView loadRequest:urlRequest];
 
//To add Safari Browser
    [[UIApplication sharedApplication]openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityAnim startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityAnim stopAnimating];
    [self.activityAnim setHidesWhenStopped:YES];
}

@end
