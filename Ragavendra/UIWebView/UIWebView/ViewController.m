//
//  ViewController.m
//  UIWebView
//
//  Created by test on 4/21/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIWebView *webview;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url=[NSURL URLWithString:@"http://apple.com"];

   //NSURLRequest *req=[NSURLRequest requestWithURL:url];


    [[ UIApplication sharedApplication]openURL:url];
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)webViewDidStartLoad:(UIWebView *)webView
{

    NSLog(@"Web Started");

 [_activity startAnimating];
   
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{

   NSLog(@"Web Finished");
  
    [_activity stopAnimating];
    
    [_activity setHidden:YES];
}



@end
