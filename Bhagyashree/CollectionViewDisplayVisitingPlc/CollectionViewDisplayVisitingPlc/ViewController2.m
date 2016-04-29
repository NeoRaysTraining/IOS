//
//  ViewController2.m
//  CollectionViewDisplayVisitingPlc
//
//  Created by test on 4/29/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLbl.text=_rcvNames[_rcvItemNo];
    self.imageLbl.image=[UIImage imageNamed:_rcvImages[_rcvItemNo]];
    if([_rcvNames[_rcvItemNo] isEqualToString:@"Banglore Palace"])
    {
        self.descLbl.text=@"Bangalore Palace, a palace located in Bengaluru, Karnataka, India, was built by Rev. J. Garrett, who was the first Principal of the Central High School in Bangalore, now known as Central College. The construction of the palace was started in 1862 and completed in 1944. In 1884, it was bought by the then Maharaja of Mysore Chamarajendra Wadiyar X.Now owned by the Mysore royal family, the palace has recently undergone a renovation.";
    }
    if([_rcvNames[_rcvItemNo] isEqualToString:@"Wonder-la"])
    {
        self.descLbl.text=@"The Wonderla resort in Bangalore is the first of its kind luxury resort in India with the Wonderla Amusement Park right in its backyard - making it an ideal place to extend your Holiday.";
    }
     if([_rcvNames[_rcvItemNo ] isEqualToString:@"Vidhan Soudha"])
     {
         self.descLbl.text=@"The Vidhana Soudha located in Bengaluru (Bangalore), is the seat of the state legislature of Karnataka. It is an imposing building, constructed in a style sometimes described as Mysore Neo-Dravidian, and incorporates elements of Indo-Saracenic and Dravidian styles. The construction was completed in 1956.";
     }
    if([_rcvNames[_rcvItemNo] isEqualToString:@"Lal bhag"])
    {
        self.descLbl.text=@"Lalbagh or Lalbagh Botanical Gardens, meaning The Red Garden in English, is a well known botanical garden in southern Bangalore, India. The garden was originally commissioned by Hyder Ali, the ruler of Mysore, and later finished by his son Tipu Sultan. It has a famous glass house which hosts two annual flower shows (January 26th & August 15th). Lalbagh houses India's largest collection of tropical plants, has a lake, and is one of the main tourist attractions in Bangalore.";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) receiveData:(NSArray*)plcNames:(NSArray*)imgNames:(long)itemNo
{
    _rcvNames=plcNames;
    _rcvImages=imgNames;
    _rcvItemNo=itemNo;
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
