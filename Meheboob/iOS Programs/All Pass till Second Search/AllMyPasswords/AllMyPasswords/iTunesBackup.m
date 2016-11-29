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
    
    self.textView.text = [NSString stringWithFormat:@"Procedure to create Backup:\n\n\nStep 1: Connect your iPhone to Mac via USB.\n\nStep 2: Launch iTunes Click on Devices -> Apps -> File Sharing -> All Passwords ->Save.\n\nStep 3: Please save the backup file on your Mac and keep it safe. \n\nStep 4: For the security reason, the backup file will be deleted when you click exit button and keep the backup file wherever you want which can be used later to restore."];
    
    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:self.textView.text];
    
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0,37)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(75,7)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(161,10)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(231,10)];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(240,162)];
    self.textView.attributedText = string;
    [self.textView setFont:[UIFont boldSystemFontOfSize:16]];

    
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
