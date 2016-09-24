//
//  ViewController.m
//  Home Screen Quick Actions
//
//  Created by Meheboob Nadaf on 24/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.imageView];
    }
    else {
        NSLog(@"ForceTouch not available. use LongPress...");
    }
    
}



- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    NSLog(@"peek");
    
    previewingContext.sourceRect = CGRectMake(0, 0, previewingContext.sourceView.frame.size.width, previewingContext.sourceView.frame.size.height);
    
    ZoomImageViewCotroller *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ZoomImageViewCotroller"];
    vc.preferredContentSize = CGSizeMake(0, 300);
    return vc;
}


- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    NSLog(@"pop");
    
    ZoomImageViewCotroller *vc = (ZoomImageViewCotroller *)viewControllerToCommit;
    vc.closeButton.hidden = NO;
    vc.view.backgroundColor = [UIColor yellowColor];
    [self presentViewController:viewControllerToCommit animated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;
    
    NSLog(@"touchesBegan : %f / %f", t.force, t.maximumPossibleForce);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;
    
    NSLog(@"touchesMoved : %f / %f", t.force, t.maximumPossibleForce);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;
    
    NSLog(@"touchesEnded : %f / %f", t.force, t.maximumPossibleForce);
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = touches.anyObject;
    
    NSLog(@"touchesCancelled : %f / %f", t.force, t.maximumPossibleForce);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
