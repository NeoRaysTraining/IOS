//
//  ViewController2.h
//  UICollectionView
//
//  Created by test on 29/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagefield;

@property(strong, nonatomic)NSArray *allImages;


-(void)getRoow : (int)rownumber;
@end
