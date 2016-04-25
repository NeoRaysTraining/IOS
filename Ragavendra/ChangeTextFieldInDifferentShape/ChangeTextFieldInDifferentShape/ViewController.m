//
//  ViewController.m
//  ChangeTextFieldInDifferentShape
//
//  Created by test on 4/25/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property NSString *textfieldVal;

@property (strong, nonatomic) IBOutlet UILabel *messageDisplayLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically
    //from a nib.
   
self.textfieldVal=self.textFieldName.text;
  
    self.messageDisplayLabel.text=self.textfieldVal;

    
_messageDisplayLabel= [[UILabel alloc]initWithFrame:CGRectMake(320, 100, 200, 60)];
    
 
    [self.view addSubview:self.messageDisplayLabel];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(LabelAnimation)
                                   userInfo:nil
                                    repeats:YES];
    [self LabelAnimation];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)Click:(id)sender
{
   
    NSLog(@"Inside Button");
  

self.messageDisplayLabel.text=[NSString stringWithFormat:@"%@",self.textfieldVal];
  
    self.messageDisplayLabel.text=@"RAGHU";
}
-(void)LabelAnimation
{
    NSLog(@"Inside Animitation");

  
    
    
    [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionTransitionNone animations:^{
        self.messageDisplayLabel.frame = CGRectMake(-320, 100, 200, 60);
    } completion:^(BOOL finished)
     {
         self.messageDisplayLabel.frame = CGRectMake(320, 100, 200, 60);
         self.messageDisplayLabel.text=self.textfieldVal;
    }];

}


 






@end
