//
//  ViewController.m
//  SnapShot
//
//  Created by Mahaboobsab Nadaf on 27/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takeSnapShot:(id)sender {
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snapShotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imageView.image = snapShotImage;
    
    [self saveImage:snapShotImage];
}

- (void)saveImage: (UIImage*)image
{

    
    UIImage *snapshot = image;
    
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^
    {
        PHAssetChangeRequest *changeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:snapshot];
        changeRequest.creationDate          = [NSDate date];
    }
                                      completionHandler:^(BOOL success, NSError *error)
    {
        if (success)
        {
            NSLog(@"successfully saved");
        }
        else 
        {
            NSLog(@"error saving to photos: %@", error);
        }
    }];
}

@end
