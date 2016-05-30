//
//  ViewController.h
//  iAdDemo
//
//  Created by test on 28/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@interface ViewController : UIViewController<ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblTimerMessage;
@property (strong, nonatomic) IBOutlet ADBannerView *bannerView;

@property(nonatomic, copy) NSSet *requiredContentSizeIdentifiers;

@end

