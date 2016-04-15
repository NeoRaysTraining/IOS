//
//  ViewController.m
//  ChangingImageAfterSwipe
//
//  Created by test on 15/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelField;

@end

@implementation ViewController{

    int swapLeftCount;
     int swapRightCount;
    
    NSMutableArray *imageNames;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imageNames = [[NSMutableArray alloc]initWithObjects:@"n2",@"n3",@"n4",@"n5",@"n6.",@"n7",@"n8", @"n1",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeLeft:(id)sender {
    
  
     NSLog(@"Inside swife left");
    
    
    
    
    if (swapLeftCount < imageNames.count) {
          self.myViewImageField.image = [UIImage imageNamed:[imageNames objectAtIndex:swapLeftCount]];
        
          swapLeftCount++;
    }
    
    else{
        
        NSLog(@"Inside else part");
    
      self.myViewImageField.image = [UIImage imageNamed:@"n0"];
        
        swapLeftCount = 0;
    }
}




- (IBAction)swipeRight:(id)sender {
    swapRightCount++;
    
    NSLog(@"Swiped Right...");
    self.labelField.text = [NSString stringWithFormat: @"Swiped Right for : %i times",swapRightCount];
}

@end
