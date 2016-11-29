//
//  iTunesClass.m
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 18/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "iTunesClass.h"

@interface iTunesClass ()

@end

@implementation iTunesClass
- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   
        return 2;
    
}


- (IBAction)backup:(id)sender {
    
    [self createActivity];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths firstObject];
    NSString* filename = @"AllPasswords";
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.backup", documentsDir, filename];
    
    NSData*data = [NSKeyedArchiver archivedDataWithRootObject:[self fetchData:1]];
    [data writeToFile:filePath atomically:NO];
    [self hideActivityView];
    

    [self desplayAlert:@"iTunes Backup" :@"iTunes Backup is successfull" : 1];
    
    
}



- (IBAction)restore:(id)sender {
    
    
    [self performSegueWithIdentifier:@"restore" sender:self];
}
@end
