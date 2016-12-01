//
//  AddNoteViewController.h
//  myExampleOnGdrive
//
//  Created by Meheboob Nadaf on 29/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNoteViewController : UITableViewController
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;

@end
