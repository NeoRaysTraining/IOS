//
//  main.m
//  WorkingWithFiles
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Giving file path to var myTextFile1
        NSString *myTextFile1 = @"/Users/test/Documents/Objective-C Buccky/WorkingWithFiles/CheckingExistanceOfFile/WorkingWithFiles/WorkingWithFiles/FirstTextFile.txt";
        
        NSFileManager *myFileManager;
        myFileManager = [NSFileManager defaultManager];
        
        //Checks whether file exist in a given path
        if([myFileManager fileExistsAtPath:myTextFile1] == NO)
        {
        
            NSLog(@"File does not exist !!!!");
           // return 1;
        }
        
        else{
            NSLog(@"Got File Successfulyy !!!");
            //return 2;
        }
        
        
        //Copy and Rename file
        
        NSString *testerFile = @"/Users/test/Documents/Objective-C Buccky/WorkingWithFiles/CheckingExistanceOfFile/WorkingWithFiles/WorkingWithFiles/testerFile.txt";
        if([myFileManager fileExistsAtPath:testerFile] == NO)
        {
            NSLog(@"testerFile.txt is not Exists !!!!!");
        }
        
        else{
            NSLog(@"testerFile.txt file Got Successfully !!!!!");
        }

        if ([myFileManager copyItemAtPath:testerFile toPath:@"/Users/test/Documents/Objective-C Buccky/WorkingWithFiles/CheckingExistanceOfFile/WorkingWithFiles/WorkingWithFiles/newFileFromtesterFile.txt" error:NULL] == NO) {
            NSLog(@"Error in Copying the file ????");
        }
        
        
        else {
            NSLog(@"File is copied Successfully from testerFile to newFileFromtesterFile.txt");
        }
    
        
        //rename and Copy
        
        if([myFileManager moveItemAtPath:@"/Users/test/Documents/Objective-C Buccky/WorkingWithFiles/CheckingExistanceOfFile/WorkingWithFiles/WorkingWithFiles/newFileFromtesterFile.txt"
                                  toPath:@"/Users/test/Documents/Objective-C Buccky/WorkingWithFiles/CheckingExistanceOfFile/WorkingWithFiles/WorkingWithFiles/newFileFile2.txt" error:NULL] == NO)
            NSLog(@"Cannot Rename the file..");
        
        
        else{
            NSLog(@"Problem in Renaming the file ???");
        }
        
        
        
        //----WORKING WITH FILE ATTRIBUTES------//
        
        NSDictionary *myDictionary;
        
        
        if ((myDictionary =[myFileManager attributesOfItemAtPath:@"/Users/test/Documents/Objective-C Buccky/WorkingWithFiles/CheckingExistanceOfFile/WorkingWithFiles/WorkingWithFiles/FirstTextFile.txt" error:NULL]) == nil){
            NSLog(@"Could not get the file trributes");
        }
        else{
        
            NSLog(@"The FirstTextFile.txt is : %i bytes",[[myDictionary objectForKey:NSFileSize]intValue]);
        }
        
        
        
        //-----DELETING FILES-------//
        
        [myFileManager removeItemAtPath:@"/Users/test/Documents/Objective-C Buccky/WorkingWithFiles/CheckingExistanceOfFile/WorkingWithFiles/WorkingWithFiles/DeleteFile.txt" error:NULL];
        
        //-----PRINTING FILE--------//
        
        NSLog(@"%@",[NSString stringWithContentsOfFile:@"/Users/test/Documents/Objective-C Buccky/WorkingWithFiles/CheckingExistanceOfFile/WorkingWithFiles/WorkingWithFiles/FirstTextFile.txt" encoding:NSUTF8StringEncoding error:NULL]);
   
    
        //------WORKING WITH DIRECTORIES -----//
        
        NSString *myDirectoryPath;
        
        //Get Current directry
        
        myDirectoryPath = [myFileManager currentDirectoryPath];
        
        NSLog(@"The directory currently i am working is : %@",myDirectoryPath);
        
        
        //Create new Directry
        
        if([myFileManager createDirectoryAtPath:@"/Users/test/Library/Developer/Xcode/DerivedData/ThisDirectryByPgm/Build/Products/Debug" withIntermediateDirectories:NO attributes:nil error:NULL]){
            NSLog(@"Problem in creating New Directry ");
        }
        else{
            NSLog(@"Sucessfully created Directry....");
        }
        
        
        
        //Rename that Directry
        
        [myFileManager moveItemAtPath:@"/Users/test/Documents/Objective-C Buccky/ThisDirectryByPgm"
                               toPath:@"//Users/test/Documents/Objective-C Buccky/RenamedDirectry"
                                error:NULL] ;
       
        
        
    }
    
   
    return 0;
}
