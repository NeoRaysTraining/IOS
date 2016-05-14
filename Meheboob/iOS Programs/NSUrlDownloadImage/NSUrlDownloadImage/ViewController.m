//
//  ViewController.m
//  NSUrlDownloadImage
//
//  Created by test on 14/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Sets the progress bar initially hidden
    self.progressView.hidden = YES;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Tells the delegate that a download task has finished downloading.

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location{

    //Stroring the data to var data from location
    NSData *data = [NSData dataWithContentsOfURL:location];

    
    //Calls main thread to execute the block of code
    dispatch_async(dispatch_get_main_queue(), ^{
    
    //Sets the image for the imageView
       [ self.imageView setImage:[UIImage imageWithData:data]];
      
        //Hides the progress Bar
        self.progressView.hidden = YES;
    
    });
    
    

}
//Tells the delegate that the download task has resumed downloading
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes{

    NSLog(@"Download task resumed");

}

//Periodically informs the delegate about the download’s progress
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{

   
    //Progress bar status
    float progress = (double)totalBytesWritten/(double)totalBytesExpectedToWrite;

    //Calls main thread to execute the block of code
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //Sets the progress to the progressView
        [self.progressView setProgress:progress];
    });
}

- (IBAction)download:(id)sender {
    
    //hides the progress Bar
    self.progressView.hidden = NO;
    
    //defines the behavior and policies to use when uploading and downloading
    NSURLSessionConfiguration *sessionConfiguraion = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //provide an API for downloading content.
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguraion delegate:self delegateQueue:nil];
    
    //Download tasks directly write the server’s response data to a temporary file
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:@"http://cdn.tutsplus.com/mobile/uploads/2013/12/sample.jpg"]];
   
    //Resumes the task, if it is suspended
    [downloadTask resume];
}
@end
