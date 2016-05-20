//
//  ViewController.m
//  CameraApplication
//
//  Created by test on 5/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()
<UINavigationControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>

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

- (IBAction)chooseImages:(id)sender
{
    UIAlertController* view = [UIAlertController alertControllerWithTitle:@"My title" message:@"Select Your choice" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Choose Image"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [self performSelector:@selector(choosePhotoFromExistingImages)];
                             //Do some thing here
                             [view dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Take a new photo"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self performSelector:@selector(takeNewPhotoFromCamera)];
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    
    [view addAction:ok];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];
    


}

-(void)takeNewPhotoFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}

-(void)choosePhotoFromExistingImages
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *profileImage;
    
    
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString*)kUTTypeImage])
    {
        profileImage = info[UIImagePickerControllerEditedImage];
        if (profileImage==nil)
            profileImage = info[UIImagePickerControllerOriginalImage];
        
        if (picker.sourceType==UIImagePickerControllerSourceTypeCamera)
            UIImageWriteToSavedPhotosAlbum(profileImage,nil,nil,nil);
        
        CGImageRef coreGraphicsImage = profileImage.CGImage;
        CGFloat height = CGImageGetHeight(coreGraphicsImage);
        CGFloat width = CGImageGetWidth(coreGraphicsImage);
        CGRect crop;
        if (height>width)
        {
            crop.size.height = crop.size.width = width;
            crop.origin.x = 0;
            crop.origin.y = floorf((height-width)/2);
        }
        else {
            crop.size.height = crop.size.width = height;
            crop.origin.y = 0;
            crop.origin.x = floorf((width-height)/2);
        }
        
        CGImageRef croppedImage = CGImageCreateWithImageInRect(coreGraphicsImage,crop);
        
        profileImage = [UIImage imageWithCGImage:croppedImage
                                           scale:MAX(crop.size.height/512,1.0)
                                     orientation:profileImage.imageOrientation];
        
        
        CGImageRelease(croppedImage);
        
        
    }
    
    self.displayImage.image=profileImage;
    
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
}


@end
