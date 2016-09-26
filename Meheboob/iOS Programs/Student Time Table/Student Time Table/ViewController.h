//
//  ViewController.h
//  Student Time Table
//
//  Created by Mahaboobsab Nadaf on 26/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)buttonPressed:(UIButton *)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;


@end

