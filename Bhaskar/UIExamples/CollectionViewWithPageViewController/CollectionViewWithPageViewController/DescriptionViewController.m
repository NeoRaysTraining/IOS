//
//  DescriptionViewController.m
//  CollectionViewWithPageViewController
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "DescriptionViewController.h"
#import "PageContentViewController.h"
#import "AppDelegate.h"

@interface DescriptionViewController ()<UIPageViewControllerDataSource>

@property (nonatomic,assign) int recievedProduct;

@property (nonatomic,strong) NSArray *productList;
@end

@implementation DescriptionViewController


-(void)viewDidLoad
{
    
    if (self.recievedProduct==0) {
        self.shirts=[[NSArray alloc]initWithObjects:@"11",@"12",@"13", nil];
    }
    if (self.recievedProduct==1) {
        self.shirts=[[NSArray alloc]initWithObjects:@"21",@"22", nil];
    }
    if (self.recievedProduct==2) {
        self.shirts=[[NSArray alloc]initWithObjects:@"31",@"32",@"33", nil];
    }

    self.productList=[[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    
    self.pageViewController =[self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource=self;
    
    PageContentViewController *startingViewController=[self viewControllerAtIndex:0];
    NSArray *viewControllers=@[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 250);
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

    
}
-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return  [self.shirts count];
}


-(PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.shirts count]==0)|| (index >=[self.shirts count])) {
        return nil;
    }
    
    PageContentViewController *pageContentViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile=self.shirts[index];
    
    pageContentViewController.pageIndex=index;
    return pageContentViewController;

   
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
    if (index==[self.shirts count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}


-(void)receiveItem:(int)productDetails
{
    self.recievedProduct=productDetails;
}
@end
