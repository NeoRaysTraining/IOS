//
//  ViewController.m
//  SegueApllication
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

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

- (IBAction)Button:(UIButton *)sender
{
    if(sender.tag == 10)
    {
        self.stv = sender.tag;
        [self performSegueWithIdentifier:@"scene1" sender:self];
        
        
    }
    else if (sender.tag == 20)
    {
        self.satya = sender.tag;
        [self performSegueWithIdentifier:@"scene1" sender:self];
    }
      else if (sender.tag == 30)
      {
          self.sundar = sender.tag ;
            [self performSegueWithIdentifier:@"scene1" sender:self];
      }
        else if (sender.tag == 40)
        {
            self.mark = sender.tag;
             [self performSegueWithIdentifier:@"scene1" sender:self];
        }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *vc = [segue destinationViewController];
    if(self.stv == 10)
    {
    [vc steve];
        self.stv=0;
    }
    else if(self.satya==20)
    {
        [vc satya];
        self.satya = 0;
    }
    else if (self.sundar==30)
    {
        [vc sundar];
        self.sundar = 0;
    }
    else if (self.mark==40)
    {
        [vc mark];
        self.mark = 0;
    }
}


@end
