//
//  ViewController2.m
//  UICollerctionViewDemo3
//
//  Created by test on 5/4/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIImageView *receivedImage;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.getAllImages=[[NSArray alloc]init];
  



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)receivedlImages:(NSArray *)allImages

{  self.getAllImages=allImages;
    NSLog(@"ALL IMAGES %@",self.getAllImages);


self.receivedImage.image=
    [UIImage imageNamed:[self.getAllImages objectAtIndex:0]];
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
