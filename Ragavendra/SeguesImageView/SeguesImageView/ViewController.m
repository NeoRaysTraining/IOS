//
//  ViewController.m
//  SeguesImageView
//
//  Created by test on 4/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewClass.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSString *images;

@end

@implementation ViewController

{


    NSArray *differentImages;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submitButton:(id)sender
{
    
    

    
self.images= self.textField.text;

    
    
    
NSLog(@"Inside Button");
    
  [self performSegueWithIdentifier:@"scene2"sender:self];


}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{


ImageViewClass *differentImages=[segue destinationViewController];
   [differentImages receivedImages:self.images];
  
}



@end
