//
//  ViewController.h
//  PrintDocument
//
//  Created by Mahaboobsab Nadaf on 07/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPrintInteractionControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)print:(id)sender;
- (IBAction)next:(id)sender;

@end

