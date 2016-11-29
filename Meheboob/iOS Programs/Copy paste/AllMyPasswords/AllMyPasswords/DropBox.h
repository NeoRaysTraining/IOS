//
//  DropBox.h
//  AllMyPasswords
//
//  Created by test on 16/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface DropBox : UITableViewController
@property (weak, nonatomic) IBOutlet UISwitch *switchDrop;
- (IBAction)dropBoxSwitch:(id)sender;
- (IBAction)backupToDroBox:(id)sender;
- (IBAction)restoreFromDropBox:(id)sender;
-(NSMutableArray*)fetchData : (int)decideView;
-(void)hideActivityView;
-(void)showActivityView;
-(void)desplayAlert : (NSString *)title : (NSString*)message : (int)alertDecide;
-(void)createActivity;
@end
