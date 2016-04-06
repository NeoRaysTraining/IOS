//
//  ViewController.m
//  ImageView2Example
//
//  Created by test on 4/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *diplayLabel;
@property(nonatomic,assign)BOOL flag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [UIImage imageNamed:@"images"];
    
    self.flag=false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressButton:(id)sender {

    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app setStringValue:@"Loading Image.."];
    NSString *message = [app getStringValue];
    [self.diplayLabel setText:message];
    
      // [self.diplayLabel setText:@"TWO"];
    
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height/2;
    self.imageView.clipsToBounds = YES;
    
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width/2;
    
    if (self.flag==false) {
       self.imageView.image = [UIImage imageNamed:@"01smith1"];
        self.flag=true;
    }else{
        [self.diplayLabel setText:@"ONE"];
        self.flag=false;
        NSLog(@"Loading the image..");
    }
  }
@end
