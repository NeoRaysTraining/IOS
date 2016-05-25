//
//  BooksViewController.m
//  SlideOutSlideBarMenuDemo
//
//  Created by test on 5/25/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "BooksViewController.h"
#import "SWRevealViewController.h"
#import "ViewController.h"
@interface BooksViewController ()


@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;



@end

@implementation BooksViewController


-(void)viewDidLoad
{
    _sideBarButton.target=self.revealViewController;
    self.sideBarButton.action=@selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

}

@end
