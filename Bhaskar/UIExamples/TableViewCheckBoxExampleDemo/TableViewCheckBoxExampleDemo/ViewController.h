//
//  ViewController.h
//  TableViewCheckBoxExampleDemo
//
//  Created by test on 5/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArray;
    
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)didTapCheckBtn:(id)sender;





@end

