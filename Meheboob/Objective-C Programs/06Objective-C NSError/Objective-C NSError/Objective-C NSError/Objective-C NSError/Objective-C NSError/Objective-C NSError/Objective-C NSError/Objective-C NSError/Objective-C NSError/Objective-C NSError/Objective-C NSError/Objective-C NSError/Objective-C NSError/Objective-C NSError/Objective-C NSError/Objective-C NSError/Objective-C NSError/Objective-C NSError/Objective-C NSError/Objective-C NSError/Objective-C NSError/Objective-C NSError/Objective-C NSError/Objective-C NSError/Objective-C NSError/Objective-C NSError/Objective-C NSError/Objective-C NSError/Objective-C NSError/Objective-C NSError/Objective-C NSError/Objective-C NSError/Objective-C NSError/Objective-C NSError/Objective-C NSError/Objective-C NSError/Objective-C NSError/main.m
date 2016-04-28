//
//  main.m
//  Objective-C NSError
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
//        NSString *fileToLoad = @"/path/to/non-existent-file.txt";
//        
//        NSError *error;
//        NSString *content = [NSString stringWithContentsOfFile:fileToLoad
//                                                      encoding:NSUTF8StringEncoding
//                                                         error:&error];
//        
//        if (content == nil) {
//            // Method failed
//            NSLog(@"Error loading file %@!", fileToLoad);
//            NSLog(@"Domain: %@", error.domain);
//            NSLog(@"Error Code: %ld", error.code);
//            NSLog(@"Description: %@", [error localizedDescription]);
//            NSLog(@"Reason: %@", [error localizedFailureReason]);
//        } else {
//            // Method succeeded
//            NSLog(@"Content loaded!");
//            NSLog(@"%@", content);
//        }
//        
       
        NSString *fileToLoadInPgm = @"myTextfile.txt";
        NSError *myError;
        
        NSString *contentToload = [NSString stringWithContentsOfFile:fileToLoadInPgm encoding:NSUTF8StringEncoding error:&myError];
        
        if(contentToload == nil)
        {
            //If method failed
            NSLog(@"Error in loading file : %@",fileToLoadInPgm);
            NSLog(@"Domain is : %@",myError.domain);
            NSLog(@"the error code is : %ld",myError.code);
            NSLog(@"Description for error is : %@",[myError localizedDescription]);
            NSLog(@"the reson for error is : %@",[myError localizedFailureReason]);
            
        }
        
        else{
        //If Method succeded
            NSLog(@"Content is loaded successfully");
            NSLog(@"the content of file is : %@",contentToload);
        
        }
        
    }
    return 0;
}
