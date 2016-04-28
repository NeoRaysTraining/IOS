//
//  ViewController2.m
//  TabelViewCustomview
//
//  Created by test on 4/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UITextView *textDisplay;


@property (weak, nonatomic) IBOutlet UIImageView *receivedImage;

@property (nonatomic,assign)int receiveValue;


@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
self.foodItemsdescription=[[NSArray alloc]initWithObjects:@"Gulab jamun, or gulaab jamun, is a milk-solids-based sweet mithai, popular in countries of South Asia and found in such as Indian cuisine, Sri Lankan cuisine, Nepalese cuisine (known as Lal Mohan), Pakistani cuisine and Bangladeshi cuisine. It is also common in Mauritius and the Caribbean countries of Trinidad and Tobago, Guyana, Suriname and Jamaica. In Nepal, it is widely known as lal mohan. It is made mainly from milk solids, traditionally from freshly curdled milk. It is often garnished with dried nuts like almonds to enhance flavour according to Middle Eastern tradition",@"Gobi Manchurian is the result of the adaptation of Chinese cooking and seasoning techniques to suit Indian tastes. It is believed to have been originally developed by a small Chinese community which lived in Kolkata for a century[when?]. In its two-stage preparation, the first stage requires preparing a spiced corn flour batter, dipping cauliflower florets in it and deep frying them. In the second stage, the deep fried florets are sautéed with chopped onion, capsicum, garlic, etc. in soy and chili sauce.",@" A bun is a (bun) small, sometimes sweet, bread, or bread roll. Though they come in many shapes and sizes, they are most commonly hand-sized or smaller, with a round top and flat bottom.Buns are usually made from flour, sugar, milk, yeast and butter. Common varieties contain small fruit or nuts, are topped with icing or caramel, or filled with jam or cream. Some types of buns are filled with various meat may also refer to particular types of filled dumplings, such as Chinese baozi. Some of these types of dumplings may be bread-like in texture.A bun is normally made from dough that has been enriched with sugar and butter and even sometimes egg. Without any of these the dough remains to be 'bread dough' rather than 'bun dough' and the resultant product will be called a roll, rather than a bun.",@"Pizza is a flatbread generally topped with tomato sauce and cheese and baked in an oven. It is commonly topped with a selection of meats, vegetables and condiments. The term was first recorded in the 10th century, in a Latin manuscript from Gaeta in Central Italy.[1] The modern pizza was invented in Naples, Italy, and the dish and its variants have since become popular in many areas of the world.[2]In 2009, upon Italy's request, Neapolitan pizza was safeguarded in the European Union as a Traditional Speciality Guaranteed dish.[3][4] The Associazione Verace Pizza Napoletana (the True Neapolitan Pizza Association) is a non-profit organization founded in 1984 with headquarters in Naples.",nil];
    
    self.textDisplay.text = [self.foodItemsdescription objectAtIndex:self.receiveValue];
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
- (IBAction)DoneButton:(id)sender {

[self dismissViewControllerAnimated:YES completion:nil];
}

-(void)receiveAllFoodItems:(int)receiveData
{
    self.receiveValue=receiveData;
}



@end
