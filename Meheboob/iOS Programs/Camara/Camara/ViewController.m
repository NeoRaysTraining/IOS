//
//  ViewController.m
//  Camara
//
//  Created by Mahaboobsab Nadaf on 20/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)changeImage:(id)sender {
    
    //AlertController for Displaiyng alert Buttons
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Camara" message:@"Select your choice" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //Choose Image Button
    UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Choose Image" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //Selects Existing Photos from Galarry by calling Method
        [self performSelector:@selector(choosePhotoFromExistingImages)];
    
        //Dismisses the AlertController
        [alertView dismissViewControllerAnimated:YES completion:nil ];
    
    }];
    
    //Alert Button to take New Photo From Camara
    UIAlertAction *Cancel = [UIAlertAction actionWithTitle:@"Take New Photo From Camara" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //Calls the method to take New Photo
        [self performSelector:@selector(takeNewPhotoFromCamara)];
        
        //Dismisses the alert after selecting Image
        [alertView dismissViewControllerAnimated:YES completion:nil ];
        
    }];
    
    //Adding the alertView Actions
    [alertView addAction:Ok];
    [alertView addAction:Cancel];
    
    //Presents the AlertView
    [self presentViewController:alertView animated:YES completion:nil];
    
    }


//Method to take New Photo from Camara
-(void)takeNewPhotoFromCamara{

    //Checks whether Camara is Available for the Device
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        

        //Allocates and initializes UIImagePickerController
        UIImagePickerController *controller = [[UIImagePickerController alloc]init];
        
        //Sets the Source type as Camara
        controller.sourceType=UIImagePickerControllerSourceTypeCamera;
        //Not allows Editing of Image
        controller.allowsEditing = NO;
        
        //Sets the Media Type source as Camara loke Image or Video
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        
        //Call the Delegates methods from this Class
        controller.delegate = self;
        
        //Presents navigationController to show Image
        [self.navigationController presentViewController:controller animated:YES completion:nil];
    }



}


//Method to browse Photos From Device Library
-(void)choosePhotoFromExistingImages{

    //Checks whether PhotoGallary is available to Display an Image
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
   
        //Allocates and initializes UIImagePickerController
        UIImagePickerController *controller = [[UIImagePickerController alloc]init];
    
        //Sets Device Photo Gallary as Source to Display an Image
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        //Not allows Editing of an Image
        controller.allowsEditing = NO;
        
        //Sets the Media type as PhotoGallary
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        //Calls the Delegates methods from this Class
        controller.delegate = self;
        
        //Shows navigationController to Dispaly an Image
        [self.navigationController presentViewController:controller animated:YES completion:nil];
        
    }
}










-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //Defines profileImage
    UIImage *profileImage;
    
    //Media type Stored in String format
    NSString *mediaTypes = info[UIImagePickerControllerMediaType];
    
    //Checks the Data is Image or Video the result in terms of String
    if ([mediaTypes isEqualToString:(NSString *)kUTTypeImage]) {
        
    
      //If profileImage
    if (profileImage == nil) {
        
        //Specifies the original, uncropped image selected by the user
        profileImage = info[UIImagePickerControllerOriginalImage];
    }
    
        //Checks whether Camara is Source type to ImageView
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        
        //Stored the Captured Image into PhotosAlbum
        UIImageWriteToSavedPhotosAlbum(profileImage, nil, nil, nil);
        
        //Stores the profileImage to coreGraphicsImage to Apply Make Changes in the Captured Image
        CGImageRef coreGraphicsImage = profileImage.CGImage;
        
        //Gets the Height of coreGraphicsImage
        CGFloat hieght = CGImageGetHeight(coreGraphicsImage);
        
         //Gets the width of coreGraphicsImage
        CGFloat width = CGImageGetHeight(coreGraphicsImage);
       
        //Defines Var crop
        CGRect crop;
        
        if (hieght>width) {
            
            //Sets Proper Height and Width to the Captured Image
            crop.size.height = crop.size.width = width;
            crop.origin.x = 0;
            crop.origin.y = floorf((hieght - width)/2);
            
        }
        
        else{
             //Sets Proper Height and Width to the Captured Image
            crop.size.height = crop.size.width = hieght;
            crop.origin.y = 0;
            crop.origin.x = floorf((hieght - width)/2);
        
        }
        
        
        //CroppedImage of coreGraphicsImage
        CGImageRef croppedImage = CGImageCreateWithImageInRect(coreGraphicsImage, crop);
        
        //ProfileImage after Adding Scaling And Pixcels
        profileImage = [UIImage imageWithCGImage:croppedImage scale:MAX(crop.size.height/512, 1.0) orientation:profileImage.imageOrientation];
        
       // Decrements the retain count of croppedImage
        CGImageRelease(croppedImage);
    }
        //Sets the image foe the ImageView
        self.imageView.image = profileImage;
        
        }
    
    //dismiss navigationController
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    //dismiss navigationController
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

}
@end
