//
//  ViewController2.m
//  SearchIFoodItemsByusingSearchBar
//
//  Created by test on 5/24/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIImageView *receivedImage;
@property (nonatomic,strong)NSMutableArray *insertArray;
@property int gettingValue;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.receivedFoodImages =[[NSMutableArray alloc]init];

    
    self.foodDescription=[[NSArray alloc]initWithObjects:@"Bhelpuri (Marathi भेळ) is a savoury snack, and is also a type of chaat. It is made out of puffed rice, vegetables and a tangy tamarind sauce",
     @"Dosa is a kind of pancake made from a fermented batter. Its main ingredients are rice and urad beans. Dosa is part and parcel of the South Indian diet and popular all over the Indian subcontinent. Traditionally, Dosa is served hot along with Sambar and Chutney."
      @" Gobi Manchurian is the result of the adaptation of Chinese cooking and seasoning techniques to suit Indian tastes. It is believed to have been originally developed by a small Chinese community which lived in Kolkata for a century[when?]. In its two-stage preparation, the first stage requires preparing a spiced corn flour batter, dipping cauliflower florets in it and deep frying them. In the second stage, the deep fried florets are sautéed with chopped onion, capsicum, garlic, etc. in soy and chili sauce.",
       @"Gulab jamun, or gulaab jamun, is a milk-solids-based sweet mithai, popular in countries of South Asia and found in such as Indian cuisine, Sri Lankan cuisine, Nepalese cuisine (known as Lal Mohan), Pakistani cuisine and Bangladeshi cuisine. It is also common in Mauritius and the Caribbean countries of Trinidad and Tobago, Guyana, Suriname and Jamaica. In Nepal, it is widely known as lal mohan. It is made mainly from milk solids, traditionally from freshly curdled milk. It is often garnished with dried nuts like almonds to enhance flavour according to Middle Eastern tradition",
    @"Panipuri (About this sound pānīpūrī (help·info)) is a common street snack in several regions of the Indian Subcontinent. In North India, it is known as Golgappe. It consists of a round, hollow puri, fried crisp and filled with a mixture of flavored water (pani), tamarind chutney, chili, chaat masala, potato, onion and chickpeas",
        @"A parotta, porotta or barotta is a layered flatbread made from maida flour, from the culinary tradition of Southern India and parts of, especially Kerala,[1] as well as Tamil Nadu. Parottas are usually available as street food [2] and in restaurants across Kerala, Tamil Nadu and parts of Karnataka. At some places it is also served at weddings, religious festivals and feasts",
@"Roti (also known as chapati) is an Indian Subcontinent flat bread, made from stoneground wholemeal flour, traditionally known as atta flour, that originated and is consumed in India, Pakistan, Nepal, Sri Lanka , Maldives and Bangladesh. It is also consumed in parts of South Africa, the southern Caribbean, particularly in Trinidad and Tobago, Guyana, Suriname, Fiji, and Grenada",
@"A samosa (/səˈmoʊsə/) or samoosa is a fried or baked dish with a savoury filling, such as spiced potatoes, onions, peas, lentils, macaroni, noodles, and/or minced meat (lamb, beef or chicken).[1] Pine nuts can also be added. Its size and consistency may vary, but typically it is distinctly triangular or tetrahedral in shape", nil];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)receivedData:(int)receiveValue{
    
    self.gettingValue=receiveValue;
    
    NSLog(@"Received Image %d",self.gettingValue);
}

    



@end
