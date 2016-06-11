//
//  ViewController3.h
//  QRCodeProject
//
//  Created by test on 10/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"
@interface ViewController3 : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(strong, nonatomic)NSData *QrStr;
-(void)recieveDetails : (NSData *)allDetails;
@end
