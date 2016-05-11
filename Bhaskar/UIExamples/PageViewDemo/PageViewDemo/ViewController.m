//
//  ViewController.m
//  PageViewDemo
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //creating the data model
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features", @"Bookmark Favorite Tip", @"Free Regular Update"];
    _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    
    //create pageviewcontroller
    self.pageViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource=self;
    
    PageContentViewController *startingViewController=[self viewControllerAtIndex:0];
    NSArray *viewControllers=@[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index=((PageContentViewController *) viewController).pageIndex;
    if ((index==0) ||(index==NSNotFound) ) {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index=((PageContentViewController *)viewController).pageIndex;
    if (index==NSNotFound) {
        return nil;
        
    }
    index++;
    if (index==[self.pageTitles count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}


-(PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    
    if (([self.pageTitles count]==0)|| (index >=[self.pageTitles count])) {
        return nil;
    }
    
    PageContentViewController *pageContentViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile=self.pageImages[index];
    pageContentViewController.titleText=self.pageTitles[index];
    pageContentViewController.pageIndex=index;
    return pageContentViewController;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return  [self.pageTitles count];
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
- (IBAction)startWalkThrough:(id)sender {
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

@end
