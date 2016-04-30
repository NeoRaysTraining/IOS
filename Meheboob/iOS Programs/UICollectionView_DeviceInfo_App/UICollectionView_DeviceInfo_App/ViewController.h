//
//  ViewController.h
//  UICollectionView_DeviceInfo_App
//
//  Created by test on 29/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong, nonatomic)NSArray *imageName;
@property(strong, nonatomic)NSArray *labelName;
@property(strong, nonatomic)NSArray *textValues;

@property (weak, nonatomic) IBOutlet UILabel *labelField;

@property (weak, nonatomic) IBOutlet UITextView *textField;


@end

