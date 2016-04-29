//
//  ViewController.h
//  UICollectionView
//
//  Created by test on 29/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"
#import "CollectionViewCell2.h"

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

//@property(strong, nonatomic)NSArray *placeNames;

@property(strong, nonatomic)NSArray *placeImages;

@end

