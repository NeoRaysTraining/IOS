//
//  WebViewController.h
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 22/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
-(void)getUrl : (NSString*)url : (NSString*)userName : (NSString*)password;

@end
