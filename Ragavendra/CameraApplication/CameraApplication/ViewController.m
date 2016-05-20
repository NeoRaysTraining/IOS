//
//  ViewController.m
//  CameraApplication
//
//  Created by test on 5/20/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController ()<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDisplay;

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
- (IBAction)chooseButton:(id)sender {


    UIAlertController *view=[UIAlertController alertControllerWithTitle:@"Camera" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Choossing Image"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [self performSelector:@selector(chooseImagesFromCamera)];
                           
                             [view dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Take a new photo"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self performSelector:@selector(takeCamera)];
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    [view addAction:ok];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];

}



/*-(void)takeCamera{
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}*/
    -(void)chooseImagesFromCamera{
       
if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
{
    UIImagePickerController *controller=[[UIImagePickerController alloc]init];
        
    controller.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    
    controller.allowsEditing=NO;
    controller.mediaTypes=[UIImagePickerController  availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    controller.delegate = self;
    
    [self.navigationController presentViewController: controller animated: YES completion: nil];
}
else{



}
}
@end
