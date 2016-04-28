//
//  main.m
//  Read/Write File
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSFileHandle *fin ,*fout;
        
        NSData *buffer;
        
        //Open testerFile for Reading
        
        fin = [NSFileHandle fileHandleForReadingAtPath:@"/Users/test/Documents/Objective-C Buccky/WorkingWithFileAttribure/Read:Write File/Write File/Write File"];
        
        [[NSFileManager defaultManager]createFileAtPath:@"/Users/test/Documents/Objective-C Buccky/WorkingWithFileAttribure/NewFile.txt" contents:nil attributes:nil];
        
        [fout truncateFileAtOffset:4];
        
        buffer = [fin readDataToEndOfFile];
        
        NSLog(@"%@",buffer);
        
        [fout writeData:buffer];
        
    }
    return 0;
}
