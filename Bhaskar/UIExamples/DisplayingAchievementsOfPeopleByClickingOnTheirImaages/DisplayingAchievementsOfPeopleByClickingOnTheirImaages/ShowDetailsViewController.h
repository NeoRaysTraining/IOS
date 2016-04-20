//
//  ShowDetailsViewController.h
//  DisplayingAchievementsOfPeopleByClickingOnTheirImaages
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *fullImgView;
@property (strong, nonatomic) IBOutlet UITextView *textDetailsView;

-(void)displayPersonDetails:(int)person;

@end
