//
//  ViewController2.h
//  CollectionViewDisplayVisitingPlc
//
//  Created by test on 4/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;
-(void) receiveData:(NSArray*)plcNames:(NSArray*)imgNames:(long)itemNo;
@property (nonatomic,strong) NSArray* rcvNames;
@property (nonatomic,strong) NSArray* rcvImages;
@property long rcvItemNo;

@end
