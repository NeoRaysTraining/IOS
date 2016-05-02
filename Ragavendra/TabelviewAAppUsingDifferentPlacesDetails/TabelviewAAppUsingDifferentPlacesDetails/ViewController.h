//
//  ViewController.h
//  TabelviewAAppUsingDifferentPlacesDetails
//
//  Created by test on 4/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSArray *differentPlaces;
@property (nonatomic,strong)NSArray *differentImages;




@end

