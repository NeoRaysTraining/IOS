//
//  ViewController.m
//  PrintDocument
//
//  Created by Mahaboobsab Nadaf on 07/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
//#import "UIPrintInteractionController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)printDocument
{
    NSString* htmlStr =  [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"swift_tutorial" ofType:@"pdf"] usedEncoding:nil error:NULL];
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
    printInfo.jobName = @"Test Print Job";
    pic.printInfo = printInfo;
    
    
    UIMarkupTextPrintFormatter* textFormatter = [[UIMarkupTextPrintFormatter alloc] 												 initWithMarkupText:htmlStr];
    
    textFormatter.startPage = 0;
    textFormatter.contentInsets = UIEdgeInsetsMake(72.0, 72.0, 72.0, 72.0);
    textFormatter.maximumContentWidth = 6 * 72.0;
    pic.printFormatter = textFormatter;
   // [textFormatter release];
    pic.showsPageRange = YES;
    
    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if (!completed && error) {
            NSLog(@"Printing error: %@", error);
        }
    };
    
    
    [pic presentFromBarButtonItem:self.navigationItem.leftBarButtonItem
                         animated:YES 
                completionHandler:completionHandler];
    
}
- (IBAction)print:(id)sender {
    
    [self printWeb];
    
    
   
}

- (IBAction)next:(id)sender {
    
    [self performSegueWithIdentifier:@"next" sender:self];
}

-(void)printWeb{

    UIPrintInfo *pi = [UIPrintInfo printInfo];
    pi.outputType = UIPrintInfoOutputGeneral;
    pi.jobName = self.webView.request.URL.absoluteString;
    pi.orientation = UIPrintInfoOrientationPortrait;
    pi.duplex = UIPrintInfoDuplexLongEdge;
    
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    pic.printInfo = pi;
    pic.showsPageRange = YES;
    pic.printFormatter = self.webView.viewPrintFormatter;
    [pic presentAnimated:YES completionHandler:^(UIPrintInteractionController *pic2, BOOL completed, NSError *error) {
        // indicate done or error
    }];
}


@end
