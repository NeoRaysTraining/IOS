//
//  ImageViewClass.h
//  SeguesImageView
//
//  Created by test on 4/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewClass : UIViewController

@property NSString *imageName;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewPicture;

-(void)receivedImages:(NSString *)images;


@end
