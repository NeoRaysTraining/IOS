//
//  ViewController.m
//  UIGestureMoveImageAndLabel
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,strong) NSArray *images;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsOutlet;
@property (nonatomic,strong) NSArray *details;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _images = @[@"chinawall",@"colosseum",@"eiffel",@"liberty statue",@"pyramid",@"taj"];
    
    _details=@[@"Chaina",@"Italy",@"France",@"USA",@"Egypt",@"India"];
    
}

static int swipeCount=0;
- (IBAction)labelMoveRight:(id)sender {
    if(swipeCount<_details.count)
    {
        self.detailsOutlet.text=[NSString stringWithFormat:@"%@ is in %@ Country",_images[swipeCount],_details[swipeCount]];
        swipeCount++;
    }
    else
    {
        swipeCount=0;
    }
    
}

static int flag=0;
- (IBAction)moveImageLeft:(id)sender {
    
  if(flag<_images.count)
    {
        self.imageView.image = [UIImage imageNamed:_images[flag]];
    self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y, self.imageView.frame.size.height, self.imageView.frame.size.width);
        self.textLabel.text=_images[flag];
        flag++;
}
    else{
        flag=0;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
