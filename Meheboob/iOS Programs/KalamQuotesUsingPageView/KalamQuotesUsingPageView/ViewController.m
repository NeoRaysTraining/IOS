//
//  ViewController.m
//  KalamQuotesUsingPageView
//
//  Created by test on 11/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.titlesArray = [[NSArray alloc]init];
    self.imagesArray = [[NSArray alloc]init];
    
    //Text for label
    self.titlesArray = @[@"APJ Abdul Kalam Quote 1",@"APJ Abdul Kalam Quote 2",@"APJ Abdul Kalam Quote 3",@"APJ Abdul Kalam Quote 4",@"APJ Abdul Kalam Quote 5",@"APJ Abdul Kalam Quote 6",@"APJ Abdul Kalam Quote 7",@"APJ Abdul Kalam Quote 8",@"APJ Abdul Kalam Quote 9",@"APJ Abdul Kalam Quote 10"];
    
    //images for imageView
    
    self.imagesArray = @[@"a1",@"a2",@"a3",@"a4",@"a5",@"a6",@"a7",@"a8",@"a9",@"a10"];
    
    //Creating PageView Controller
    
    self.myPageViewController = [self.storyboard
                                  instantiateViewControllerWithIdentifier:@"PageViewController"];
    
    //Defines the datasource for the PageView Controller as this class
    self.myPageViewController.dataSource = self;
    
    //Tells the starting point of view controller
    ContentViewController *startingViewControllerOfPage = [self viewControllerAtTheIndex:0];
    
    //Stores the next ViewControllers
    NSArray *myViewController = @[startingViewControllerOfPage];
    
    
    //Forward Navigation of ViewControllers
    [self.myPageViewController setViewControllers:myViewController direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Changing the size of page view controller
    self.myPageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    //Adds the specified pageViewController as ChildViewController to the ViewController
    [self addChildViewController:self.myPageViewController];
    
    //Adds the SubView to the main View
    [self.view addSubview:self.myPageViewController.view];
    
    
    //Called when added or removed from the container
    [self.myPageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAgain:(id)sender {
    
    ContentViewController *startViewController = [self viewControllerAtTheIndex:0];
    NSArray *viewControllers = @[startViewController];
    
    [self.myPageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}






-(ContentViewController *)viewControllerAtTheIndex : (NSUInteger)index{

    if (([self.titlesArray count] == 0)||(index >= [self.titlesArray count])) {
        return nil;
    }
    
    //Creating New ViewCotroller for Passing Suitable Data

    ContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageViewController"];
    
    pageContentViewController.imageImage = self.imagesArray[index];
    
    pageContentViewController.imageTitle = self.titlesArray[index];
    
    pageContentViewController.pageIndex  = index;
    return pageContentViewController;
}



- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{


    NSUInteger index = ((ContentViewController *)viewController).pageIndex;
    
    if ((index == 0)|| (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtTheIndex:index];

}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{

    NSUInteger index = ((ContentViewController *)viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }

    index++;
    
    if (index == [self.titlesArray count]) {
        return nil;
    }
    
    return [self viewControllerAtTheIndex:index];
}


//Gives the number of items reflected in the view controller
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{

    return [self.titlesArray count];
}
-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;

}

@end
