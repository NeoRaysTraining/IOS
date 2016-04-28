//
//  main.m
//  Objective-C NSError
//
//  Created by Meheboob
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
      
       
        NSString *fileToLoadInPgm = @"/Users/test/Documents/Objective-C Buccky/06Objective-C NSError/Objective-C NSError/Objective-C NSError/myTextfile.txt";
       
       // NSString *fileToLoadInPgm =@"Users/test/Documents/fileNotExist.txt";
        
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
            NSLog(@"The content of file is : %@",contentToload);
        
        }
        
    }
    return 0;
}
