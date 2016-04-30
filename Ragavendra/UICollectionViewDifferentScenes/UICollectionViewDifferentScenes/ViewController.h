//
//  ViewController.h
//  UICollectionViewDifferentScenes
//
//  Created by test on 4/29/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;


@property (weak, nonatomic) IBOutlet UITextView *textView;



@end

