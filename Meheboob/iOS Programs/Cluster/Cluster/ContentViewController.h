//
//  ContentViewController.h
//  Cluster
//
//  Created by test on 15/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "Modules.h"
@interface ContentViewController : UIViewController
@property(strong, nonatomic)Modules *moduleObject;
@property (weak, nonatomic) IBOutlet UIImageView *imageField;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextView *textViewField;

@end
