//
//  ViewController.h
//  PhotoSharing
//
//  Created by test on 7/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UIWebView *loginWebView;
    IBOutlet UIActivityIndicatorView* loginIndicator;
    IBOutlet UILabel *loadingLabel;
}
@property(strong,nonatomic)NSString *typeOfAuthentication;


@end

