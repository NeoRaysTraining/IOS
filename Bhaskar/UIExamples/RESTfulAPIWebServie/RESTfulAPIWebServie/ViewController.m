//
//  ViewController.m
//  RESTfulAPIWebServie
//
//  Created by test on 5/23/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *greetingId;
@property (strong, nonatomic) IBOutlet UILabel *greetingContent;

@end

@implementation ViewController
- (IBAction)action:(id)sender {
    
    NSURL *url=[NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data.length>0 && connectionError==nil) {
            NSDictionary *greeting=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.greetingId.text=[[greeting valueForKey:@"id"] stringValue];
            self.greetingContent.text=[greeting valueForKey:@"content"];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
