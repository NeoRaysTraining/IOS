//
//  ViewController2.h
//
//
//  Created by test on 4/27/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface ViewController2 : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong)NSString *enteredFieldname;
@property  (nonatomic,strong)NSString *entererdage;

@property (nonatomic,strong)NSMutableArray *gettingCountry;
@property (nonatomic,strong)NSMutableArray *gettingGender;


-(void)receivedAllDetails:(NSMutableArray *)recfieldcountry :(NSMutableArray*)recgender;
-(void)receivednameandAge:(NSString *)enteredFieldname :(NSString *)entererdAge;



@end
