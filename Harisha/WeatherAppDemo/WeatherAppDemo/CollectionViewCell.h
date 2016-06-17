//
//  CollectionViewCell.h
//  WeatherAppDemo
//
//  Created by test on 6/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *collectionImage;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperature;

@end
