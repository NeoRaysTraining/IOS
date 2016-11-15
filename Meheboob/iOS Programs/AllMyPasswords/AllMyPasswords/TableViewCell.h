//
//  TableViewCell.h
//  AllMyPasswords
//
//  Created by Mahaboobsab Nadaf on 14/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIView *swipableUIView;


@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *password;
//@property (weak, nonatomic) IBOutlet UIImageView *imageview;
-(void)hideButtonsForView:(UIView *)cellView;
-(void)showHiddenButtonsForView2:(UIView *)cellView;
@property (weak, nonatomic) IBOutlet UILabel *userNameT;
@property (weak, nonatomic) IBOutlet UILabel *passwordT;

@property (weak, nonatomic) IBOutlet UIButton *buttonImage;

-(void)swifeLeft ;
@end
