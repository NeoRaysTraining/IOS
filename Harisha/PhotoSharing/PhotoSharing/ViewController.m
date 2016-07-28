//
//  ViewController.m
//  PhotoSharing
//
//  Created by test on 7/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "DisplayProfileViewController.h"
#define INSTAGRAM_AUTHURL @"https://api.instagram.com/oauth/authorize/"
#define INSTAGRAM_APIURl  @"https://api.instagram.com/v1/users/"
#define INSTAGRAM_CLIENT_ID @"3c0f93d03f7f496591aecec660f2562a"
#define INSTAGRAM_CLIENTSERCRET @"868587d49f5840fa8ab71109a02291c0"
#define INSTAGRAM_REDIRECT_URI  @"http://yourcallback.com/"
#define INSTAGRAM_ACCESS_TOKEN                          @"access_token"
#define INSTAGRAM_SCOPE @"likes+comments+relationships"

@interface ViewController ()
@property(strong,nonatomic)NSDictionary* json;
@property(strong,nonatomic)NSArray* jsonArray;

@property (strong,nonatomic)NSDictionary* apiValues;
@property(strong,nonatomic)NSString* accessToken;

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

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    NSString* authURL = nil;
    
    if ([_typeOfAuthentication isEqualToString:@"UNSIGNED"])
    {
        authURL = [NSString stringWithFormat: @"%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True",
                   INSTAGRAM_AUTHURL,
                   INSTAGRAM_CLIENT_ID,
                   INSTAGRAM_REDIRECT_URI,
                   INSTAGRAM_SCOPE];
        
    }
    else
    {
        authURL = [NSString stringWithFormat: @"%@?client_id=%@&redirect_uri=%@&response_type=code&scope=%@&DEBUG=True",
                   INSTAGRAM_AUTHURL,
                   INSTAGRAM_CLIENT_ID,
                   INSTAGRAM_REDIRECT_URI,
                   INSTAGRAM_SCOPE];
    }
    
    
    [loginWebView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: authURL]]];
    [loginWebView setDelegate:self];
    
    
}

#pragma mark -
#pragma mark delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{
    return [self checkRequestForCallbackURL: request];
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    [loginIndicator startAnimating];
    loadingLabel.hidden = NO;
    [loginWebView.layer removeAllAnimations];
    loginWebView.userInteractionEnabled = NO;
    [UIView animateWithDuration: 0.1 animations:^{
        //  loginWebView.alpha = 0.2;
    }];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [loginIndicator stopAnimating];
    loadingLabel.hidden = YES;
    [loginWebView.layer removeAllAnimations];
    loginWebView.userInteractionEnabled = YES;
    [UIView animateWithDuration: 0.1 animations:^{
        //loginWebView.alpha = 1.0;
    }];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self webViewDidFinishLoad: webView];
}


- (BOOL) checkRequestForCallbackURL: (NSURLRequest*) request
{
    NSString* urlString = [[request URL] absoluteString];
    
    if ([self.typeOfAuthentication isEqualToString:@"UNSIGNED"])
    {
        // check, if auth was succesfull (check for redirect URL)
        if([urlString hasPrefix: INSTAGRAM_REDIRECT_URI])
        {
            // extract and handle access token
            NSRange range = [urlString rangeOfString: @"#access_token="];
            [self handleAuth: [urlString substringFromIndex: range.location+range.length]];
            return NO;
        }
    }
    else
    {
        if([urlString hasPrefix: INSTAGRAM_REDIRECT_URI])
        {
            // extract and handle code
            NSRange range = [urlString rangeOfString: @"code="];
            [self makePostRequest:[urlString substringFromIndex: range.location+range.length]];
            return NO;
        }
    }
    
    return YES;
    
}
-(void)makePostRequest:(NSString *)code
{
    
    NSString *post = [NSString stringWithFormat:@"client_id=%@&client_secret=%@&grant_type=authorization_code&redirect_uri=%@&code=%@",INSTAGRAM_CLIENT_ID,INSTAGRAM_CLIENTSERCRET,INSTAGRAM_REDIRECT_URI,code];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    NSMutableURLRequest *requestData = [NSMutableURLRequest requestWithURL:
                                        [NSURL URLWithString:@"https://api.instagram.com/oauth/access_token"]];
    [requestData setHTTPMethod:@"POST"];
    [requestData setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [requestData setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [requestData setHTTPBody:postData];
    
    NSURLResponse *response = NULL;
    NSError *requestError = NULL;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:requestData returningResponse:&response error:&requestError];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:nil];
    self.apiValues = [dict valueForKey:@"user"];
    if(dict != nil)
    {
        [self performSegueWithIdentifier:@"scene2" sender:self];
    }
    
    
    
    NSLog(@"Api values Are %@",[self.apiValues valueForKey:@"username"]);
    self.accessToken = [dict valueForKey:@"access_token"];
    NSLog(@"access token %@",self.accessToken);
    
     //[self receiveFollower];
    
    [self handleAuth:[dict valueForKey:@"access_token"]];
    
}

- (void) handleAuth: (NSString*) authToken
{
    NSLog(@"successfully logged in with Tocken == %@",authToken);
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DisplayProfileViewController* vc = [segue destinationViewController];
    
    [vc receiveData:self.apiValues];

}

-(void)receiveFollower
{
    NSString* newUrl = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/self/follows?access_token=%@",self.accessToken];
    NSLog(@"new url %@",newUrl);
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:newUrl] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
                                      {
                                          self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                           NSLog(@"%@",self.json);
                                          
                                          self.jsonArray = [self.json valueForKey:@"data"];
                                          NSLog(@"value is %@",self.jsonArray);
                                          
                                          ;
                                      }
                                      ];
    
    [dataTask resume];
    
    
}


@end
