//
//  ViewController.m
//  WebView
//
//  Created by test on 21/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *fullURL = @"http://apple.com";
    NSURL *url = [NSURL URLWithString:fullURL];
NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
   [_webView loadRequest:requestObj];
    

   // [[UIApplication sharedApplication ]openURL:url];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)webViewDidStartLoad:(UIWebView *)webView{

    NSLog(@"Web view start loading...");
    
    [_activity startAnimating];


}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"Web view finished loading...");
    
    [_activity stopAnimating];
    
    [_activity setHidden:YES];



}

- (IBAction)leftSwife:(id)sender {
    
    NSLog(@"Inside left swife");
    
    [self.webView goBack];
}

- (IBAction)rightSwipe:(id)sender {
        NSLog(@"Inside left swife");
    
    [self.webView goForward];
}

@end
