//
//  ImageViewClass.m
//  SeguesImageView
//
//  Created by test on 4/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ImageViewClass.h"

@interface ImageViewClass ()

@end

@implementation ImageViewClass


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if ([_imageName isEqualToString:@"One"])
        
    {
        self.imageViewPicture.image=[UIImage imageNamed:@"1"];
    }
    else if([_imageName isEqualToString:@"TWO"])
    {
        
        self.imageViewPicture.image=[UIImage imageNamed:@"2"];
        
        
    }
    else if([_imageName isEqualToString:@"Three"])
    {
        
        self.imageViewPicture.image=[UIImage imageNamed:@"3"];
    }
    else if([_imageName isEqualToString:@"Apple"])
    {
        
        self.imageViewPicture.image=[UIImage imageNamed:@"Apple"];
        
    }
    
    else if([_imageName isEqualToString:@"Grapes"])
    {
        
        self.imageViewPicture.image=[UIImage imageNamed:@"Grapes"];
    }
else if([_imageName isEqualToString:@"Banana"])
    {
        
self.imageViewPicture.image=[UIImage imageNamed:@"Banana"];
  
    }
    
else

{
        
    


}







}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) receivedImages:(NSString*) images
{
    self.imageName=images;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
