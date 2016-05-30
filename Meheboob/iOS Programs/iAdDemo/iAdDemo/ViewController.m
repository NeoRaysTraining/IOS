//
//  ViewController.m
//  iAdDemo
//
//  Created by test on 28/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic)NSTimer *timer;
@property(nonatomic) int secondsElapsed;
@property(nonatomic) BOOL pauseTimeCounting;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
     //Do any additional setup after loading the view, typically from a nib.
      //self.canDisplayBannerAds = YES;
    

    _bannerView.delegate = self;
    self.bannerView = [[ADBannerView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-100, 0, 0)];
    
  [self.view addSubview:self.bannerView];
 //   self.bannerView.delegate = self;
    self.bannerView.alpha = 0.0;
    
  
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showTimerMessage) userInfo:nil repeats:YES];
    self.secondsElapsed = 0;
    
    //[self.view addSubview:self.adBanner];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad banner will load Ad");

}


-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"Ad banner Did load Ad");
    //
  
    [UIView animateWithDuration:0.5 animations:^{
        self.bannerView.alpha = 1.0;
    }];
    

}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{

    NSLog(@"Ad Banner action is about to begin.");
    
    self.pauseTimeCounting = YES;
    
    return YES;
}
-(void)bannerViewActionDidFinish:(ADBannerView *)banner{

    NSLog(@"Ad Banner action did finish");
    
    self.pauseTimeCounting = NO;
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{

    NSLog(@"Unable to show ads. Error: %@", [error localizedDescription]);
    
//    // Hide the ad banner.
//    [UIView animateWithDuration:0.5 animations:^{
//        self.bannerView.alpha = 0.0;
//    }];
    
    // Changed NSLog to print the error that is received
    NSLog(@"didFailToReceiveAdWithError: %@", error);
    [UIView animateWithDuration:0.5 animations:^{
        self.bannerView.alpha = 0.0;
    }];
    
    if (self.bannerView) {
        self.bannerView.hidden =YES;
    }
    
}

-(void)showTimerMessage{
    if (!self.pauseTimeCounting) {
        self.secondsElapsed++;
        
        self.lblTimerMessage.text = [NSString stringWithFormat:@"You've been viewing this view for %d seconds", self.secondsElapsed];
    }
    else{
        self.lblTimerMessage.text = @"Paused to show ad...";
    }

}

//this is the working method; note the method name
//- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
//    NSLog(@"banner failed to receive ad with error:%@", error);
//    if (self.bannerIsVisible) {
//        [self hidesBanner];
//    }
//}
@end
