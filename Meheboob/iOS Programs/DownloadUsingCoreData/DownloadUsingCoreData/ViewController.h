//
//  ViewController.h
//  DownloadUsingCoreData
//
//  Created by Mahaboobsab Nadaf on 17/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController

- (IBAction)dowload:(id)sender;
@property(strong, nonatomic)NSString *urlString;
@property(strong, nonatomic)NSDictionary *json;
@property BOOL *checkFile;
@end

