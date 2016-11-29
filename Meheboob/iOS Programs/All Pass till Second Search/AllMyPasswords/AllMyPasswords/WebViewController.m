//
//  WebViewController.m
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 22/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController{

    NSString *getUrl;
    
    NSString*getUserName;
    
    NSString *getPassword;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.%@.com",getUrl]]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButton:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
        
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }
    
}

- (IBAction)homeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //For Authentication
    NSString *savedUsername = getUserName;
    NSString *savedPassword = getPassword;
    
    if (savedUsername.length != 0 && savedPassword.length != 0)
    {
        //create js strings
        NSString *loadUsernameJS = [NSString stringWithFormat:@"var inputFields = document.querySelectorAll(\"input[type='text']\"); \
                                    for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '%@';}", savedUsername];
        
        NSString *loadUseremail = [NSString stringWithFormat:@"var inputFields = document.querySelectorAll(\"input[type='email']\"); \
                                    for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '%@';}", savedUsername];
        NSString *loadUsereName = [NSString stringWithFormat:@"var inputFields = document.querySelectorAll(\"input[type='username']\"); \
                                   for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '%@';}", savedUsername];
        
        NSString *loadUserePhone = [NSString stringWithFormat:@"var inputFields = document.querySelectorAll(\"input[type='username']\"); \
                                   for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '%@';}", savedUsername];
        
        
        
        NSString *loadPasswordJS = [NSString stringWithFormat:@"var inputFields = document.querySelectorAll(\"input[type='password']\"); \
                                    for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '%@';}", savedPassword];
        
        //autofill the form
        [self.webView stringByEvaluatingJavaScriptFromString: loadUsernameJS];
        [self.webView stringByEvaluatingJavaScriptFromString: loadPasswordJS];
        [self.webView stringByEvaluatingJavaScriptFromString: loadUseremail];
        [self.webView stringByEvaluatingJavaScriptFromString: loadUsereName];
         [self.webView stringByEvaluatingJavaScriptFromString: loadUserePhone];
    }
    
}

-(void)getUrl:(NSString *)url :(NSString *)userName :(NSString *)password{

    getUrl = url;
    getUserName = userName;
    getPassword = password;
    
}
@end
