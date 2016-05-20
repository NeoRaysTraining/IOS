//
//  ViewController.h
//  Camera
//
//  Created by Mahaboobsab Nadaf on 20/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

//Delegates for controlling Camara and Images

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
//UIActionSheetDelegate,
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)changeImage:(id)sender;

@end

