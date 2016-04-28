//
//  ViewController2.h
//  Segueys_using_Table_View
//
//  Created by test on 28/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController.h"

@interface ViewController2 : UIViewController
@property(strong, nonatomic) NSArray *namesOfPlace;
@property(strong, nonatomic) NSArray *ImagesOfPlace;

@property (strong, nonatomic)NSArray *placeDesciption;

-(void)getRowNumber : (int)recieveNumber;


@property (strong, nonatomic) IBOutlet UILabel *placeLebel;




@property (weak, nonatomic) IBOutlet UIImageView *imageLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end
