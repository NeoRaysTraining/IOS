//
//  ViewController2.m
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 10/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.info = [[NSString alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location{
    
    //Stroring the data to var data from location
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    
    //Calls main thread to execute the block of code
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //Sets the image for the imageView
        [ self.imageView setImage:[UIImage imageWithData:data]];
        
        //Hides the progress Bar
        
        
    });
    
    
    
}

- (IBAction)shareButton:(id)sender {
    
    self.info = [NSString stringWithFormat:@"Name:%@Age:%@Gender:%@B.Group:%@Location:%@",self.nameField.text,self.ageField.text,self.genderField.text,self.bgroup.text,self.locationField.text];

   // self.info = @"Hi";
    
    NSLog(@"Info is : %@",_info);
    
    //defines the behavior and policies to use when uploading and downloading
    NSURLSessionConfiguration *sessionConfiguraion = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //provide an API for downloading content.
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguraion delegate:self delegateQueue:nil];
    
    //Download tasks directly write the server’s response data to a temporary file
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=%@",self.info]]];
    
    //Resumes the task, if it is suspended
    [downloadTask resume];

    
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    int length = [currentString length];
    if (length > 4) {
        return NO;
    }
    return YES;
}


@end
