//
//  ViewController.m
//  WebServicesDoenloadTask1
//
//  Created by test on 5/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate,NSURLSessionDownloadDelegate>
{
    NSURLSession* _session;
}
@property (weak, nonatomic) IBOutlet UIButton *resume;
- (IBAction)cancel:(id)sender;

- (IBAction)resume:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property(strong,nonatomic)NSURLSessionDownloadTask* downloadTask;
@property(strong,nonatomic)NSData* resumeData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession* session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURLSessionDownloadTask* downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:@"http://cdn.tutsplus.com/mobile/uploads/2013/12/sample.jpg"]];
    
    
    [self addObserver:self forKeyPath:@"resumeData" options:NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:@"downloadTask" options:NSKeyValueObservingOptionNew context:NULL];
    
    // Setup User Interface
    //[self.cancel setHidden:YES];
    //[self.resume setHidden:YES];
    [downloadTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    dispatch_async(dispatch_get_main_queue(),^{
        [self.displayImage setImage:[UIImage imageWithData:data]];
        
    });
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float value = (double)totalBytesWritten/(double)totalBytesExpectedToWrite;
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [self.displayProgress setProgress:value];
    });
}
- (IBAction)cancel:(id)sender
{
    if (!self.downloadTask) return;
    
    // Hide Cancel Button
    [self.cancel setHidden:YES];
    
    [self.downloadTask cancelByProducingResumeData:^(NSData *resumeData) {
        if (!resumeData) return;
        [self setResumeData:resumeData];
        [self setDownloadTask:nil];
    }];
}

- (IBAction)resume:(id)sender
{
    if (!self.resumeData) return;
    
    // Hide Resume Button
    [self.resume setHidden:YES];
    
    // Create Download Task
    self.downloadTask = [self.session downloadTaskWithResumeData:self.resumeData];
    
    // Resume Download Task
    [self.downloadTask resume];
    
    // Cleanup
    [self setResumeData:nil];
    
}
- (NSURLSession *)session {
    if (!_session) {
        // Create Session Configuration
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        // Create Session
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    }
    
    return _session;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"resumeData"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.resume setHidden:(self.resumeData == nil)];
        });
        
    } else if ([keyPath isEqualToString:@"downloadTask"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.cancel setHidden:(self.downloadTask == nil)];
        });
    }
}
@end
