//
//  iTunesBackup.m
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 18/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "iTunesBackup.h"

@interface iTunesBackup ()

@end

@implementation iTunesBackup

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)removeFile:(NSString *)filename
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:filename];
    NSError *error;
    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
    if (success) {
        NSLog(@"Successfully removed passwords");
    }
    else
    {
        NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
    }
}
- (IBAction)exit:(id)sender {
   
    [self dismissViewControllerAnimated:YES completion:^{
         [self removeFile:@"AllPasswords.backup"];
    }];
}


@end
