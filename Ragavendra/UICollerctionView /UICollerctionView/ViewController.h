//
//  ViewController.h
//  UICollerctionView
//
//  Created by test on 4/29/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource, UIGestureRecognizerDelegate>
{
    UITapGestureRecognizer *tap;
    BOOL isFullScreen;
    CGRect prevFrame;
}




@end

