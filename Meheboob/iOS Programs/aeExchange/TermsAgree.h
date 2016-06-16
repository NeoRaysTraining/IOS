//
//  TermsAgree.h
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 16/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermsAgree : UIViewController
- (IBAction)agreeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
