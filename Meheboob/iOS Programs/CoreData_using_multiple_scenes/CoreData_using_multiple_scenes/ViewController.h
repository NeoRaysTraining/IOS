//
//  ViewController.h
//  CoreData_using_multiple_scenes
//
//  Created by test on 06/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>



- (IBAction)addButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(strong, nonatomic)NSArray *coreObject;
@end

