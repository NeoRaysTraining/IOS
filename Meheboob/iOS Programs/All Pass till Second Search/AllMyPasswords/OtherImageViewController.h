//
//  OtherImageViewController.h
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 24/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherImageViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>


- (IBAction)cancelButton:(id)sender;

-(void)revieweTableIndex : (int)tableIndex;

@end
