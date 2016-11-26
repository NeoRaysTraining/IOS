//
//  ImageViewController.h
//  AllMyPasswords
//
//  Created by test on 11/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ImageViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>


- (IBAction)cancelButton:(id)sender;

-(void)revieweTableIndex : (NSIndexPath*)tableIndex;
@end
