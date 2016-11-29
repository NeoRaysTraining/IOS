//
//  OtherDetailViewController.h
//  
//
//  Created by Meheboob Nadaf on 24/11/16.
//
//

#import <UIKit/UIKit.h>

@interface OtherDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property (weak, nonatomic) IBOutlet UIButton *buttonImageView;
- (IBAction)buttonImage:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

- (IBAction)backButton:(id)sender;

- (void)addORDeleteRows;

-(void)receiveallDetails : (NSIndexPath*)reciedIndexPath;;


@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;

- (IBAction)doneButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonOut;


@property (weak, nonatomic) IBOutlet UIToolbar *hideAllButtona;


- (IBAction)deleteButton:(id)sender;

- (IBAction)forward:(id)sender;

@end
