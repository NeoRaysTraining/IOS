//
//  ViewController.h
//  WebserviceDownloadTask
//
//  Created by test on 5/14/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDisplay;


@end

