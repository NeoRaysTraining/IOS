//
//  ViewController2.m
//  Segueys_using_Table_View
//
//  Created by test on 28/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2{

    int recievedNumberFromView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.namesOfPlace = [[NSArray alloc]initWithObjects:@"Ghataprabha birds sanctuary",@"Gokak Falls",@"Vijayanagar Hampi",@"Halebidu Temple",@"Badami Cave Temples",@"Kudroli Gokarnath Temple",@"Gol Gumbaz",@"Visvesvaraya Technological Museum",@"Lalbagh Botanical Garden",@"Godchinamalaki Falls", nil];
    
    self.ImagesOfPlace = [[NSArray alloc]initWithObjects:@"IGhataprabha bird sanctuary",@"IGokak False",@"IVijayanagar Hampi",@"IHalebidu Temple",@"IBadami Cave Temples",@"IKudroli Gokarnath Temple",@"IGol Gumbaz",@"IVisvesvaraya Industrial and Technological Museum",@"ILalbagh Botanical Garden",@"IGodchinamalaki Falls", nil];
    
    
    
    
    
    
    self.placeDesciption = [[NSArray alloc]initWithObjects:@"Ghataprabha bird sanctuary : Ghataprabha is a village in the southern state of Karnataka, India.It is located in the Gokak taluk of Belgaum district in KarnatakaBird SanctuaryGhataprabha Bird Sanctuary is 29.78 square kilometres, and its boundaries enclose a stretch of about 28 km of the Ghataprabha River, including the reservoir resulting from the dam built near Dhupdhal. The sanctuary is known for migratory birds such as the demoiselle crane and European white stork. It is surrounded by agricultural fields. Between November and March is the best time to visit the sanctuary, when most of the migratory bird species nest there",
                            
                            
                            
                            
                            @"Gokak Falls : The Gokak Falls is a waterfall located on the Ghataprabha River in Belagavi district of Karnataka, India. The waterfall is six kilometers away from GokakAfter a long winding course, the Ghataprabha river takes a leap of 52 metres (171 ft) over the sand-stone cliff amidst a picturesque gorge of the rugged valley, resembling Niagara Falls on a smaller scale. The waterfall is horse shoe shaped at the crest, with a flood breadth of 177 metres (581 ft). During rainy season, the thick reddish brown water sweeps far over the brink of the cliff with a dull roar that can be heard from some distance. There is a hanging bridge across the river, measuring about 201 metres (659 ft). Its height above the rock bed is 14 metres (46 ft). There is an old electricity generation station and electricity was generated here for the first time in 1887.",
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            @"Vijayanagar Hampi : Vijaya Nagara is in Ballari district,Karnataka. It is the name of the now-ruined capital city that surrounds modern-day Hampi, of the historic Vijayanagara Empire which extended over South India.Around 1500, Vijaynagara had about 500,000 inhabitants (supporting 0.1% of the global population during 1440-1540), making it the second largest city in the world after Beijing and almost twice the size of Paris. The ruins are now a World Heritage Site. ",
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            @"Halebidu Temple : Halebidu was the 12th-13th century capital of the Hoysala empire. The Hoysaleswara temple was built during this time by Ketamala (around 1121 AD) and attributed to King Vishnuvardhana, the Hoysala ruler. It is believed to have been completed around 1160 AD by Kedaroja, the chief architect of Vishnuvardhana's son and Successor Narasimha I(1142 - 1173). It enshrines Hoysaleswara and Shantaleswara, named after King Vishnuvardhana Hoysala and his Queen Shantala Devi.The town was sacked by the armies of Malik Kafur in the early 14th century, after which it fell into a state of disrepair and neglect. ",
                            
                            
                            
                            
                            @"Badami Cave Temples : Badami formerly known as Vatapi, is a town and headquarters of a taluk by the same name, in the Bagalkot district of Karnataka, India. It was the regal capital of the Badami Chalukyas from 540 to 757 AD. It is famous for its rock cut structural temples. It is located in a ravine at the foot of a rugged, red sandstone outcrop that surrounds Agastya lake. Badami has been selected as one of the heritage cities for HRIDAY - Heritage City Development and Augmentation Yojana scheme of Government of India.",
                            
                            
                            
                            
                            @"Kudroli Gokarnath Temple : The Gokarnanatheshwara Temple, otherwise known as Kudroli Sri Gokarnanatha Kshetra, is in the Kudroli area of Mangalore in Karnataka, India. It was consecrated by Narayana Guru. It is dedicated to Gokarnanatha, a form of Lord Shiva. Compared to the other temples in and around Mangalore this temple was built recently.The Billava community was traditionally suppressed by the upper caste treating them as untouchables. It is in such a scenario that the community found a messiah in Narayana Guru. Narayana Guru has been regarded as the uplifter of the downtrodden and a visionary social servant.",
                            
                            
                            
                            
                            
                            @"Gol Gumbaz : Gol Gumbaz is the mausoleum of Mohammed Adil Shah, Sultan of Bijapur. The tomb, located in Bijapur, Karnataka in India, was completed in 1656 by the architect Yaqut of Dabul. The name finds its roots from Gola gummata deriving from Gol Gombadh meaning circular dome. It is constructed as per the Deccan architecture.The structure is composed of a cube, 47.5 metres (156 ft) on each side, capped by a dome 44 m (144 ft) in external diameter. Eight intersecting arches created by two rotated squares that create interlocking pendentives support the dome. At each of the four corners of the cube, is a dome-capped octagonal tower seven stories high with a staircase inside. The upper floor of each opens on to a round gallery which surrounds the dome. Inside the mausoleum hall, is a square podium with steps on each side. In the middle of the podium, a cenotaph slab on the ground marks the actual grave below, the only instance of this practice in the architecture of the Adil Shahi Dynasty. In the middle of the north side, a large semi-octagonal bay protrudes out. With an area of 1,700 m2 (18,000 sq ft),[3] the mausoleum has one of the biggest single chamber spaces in the world. Running around the inside of the dome is the Whispering Gallery where even the softest sound can be heard on the other side of the mausoleum due to the acoustics of the space. ",
                            
                            
                            
                            
                            @"Visvesvaraya Technological Museum : The Visvesvaraya Industrial and Technological Museum, Bangalore(VITM), India. a constituent unit of National Council of Science Museums (NCSM), Ministry of Culture, Government of India, was established in memory of Bharat Ratna Sir M Visvesvaraya.This is a classical and modest building with a built up area of 4000 m2, was constructed in the breathtaking surrounding of the Cubbon Park, housing various scientific experimentsand engines, which was opened by the first Prime Minister of India, Pandit Jawaharlal Nehru on 14.07.1962. The first gallery set up at VITM on the theme ‘Electricity” was opened to the public on 27.07.1965.In order to honour Bharat Ratna Sir M Visvesvaraya, the great visionary, celebrated engineer and statesman of our country, the All India Manufactures’ Organization, Mysore State Board, decided to set up a Science & Technology Museum at Bangalore and the foundation stone was laid by Shri B.D. Jatti, Chief Minister of erstwhile Mysore State on 15.09.1958. The Visvesvaraya Industrial Museum Society (VIMS) came to be registered as the nodal agency in order to pool in resources from various industrial houses. A modest building with a built up area of 4000 m2, was constructed by the Society in the serene surrounding of the Cubbon Park, housing various industrial products and engines which was opened by the first Prime Minister of India, Pandit Jawaharlal Nehru on 14.07.1962"
                            
                            
                            
                            
                            
                            ,@"Lalbagh Botanical Garden : Lalbagh or Lalbagh Botanical Gardens, meaning The Red Garden in English, is a well known botanical garden in southern Bangalore, India. The garden was originally commissioned by Hyder Ali, the ruler of Mysore, and later finished by his son Tipu Sultan.[1] It has a famous glass house which hosts two annual flower shows (January 26th & August 15th). Lalbagh houses India's largest collection of tropical plants, has a lake, and is one of the main tourist attractions in Bangalore.[2] Lal Bagh is also home to a few species of birds. The commonly sighted birds include Myna, parakeets, crows, Brahmini Kite, Pond Heron, Common Egret, Purple Moor Hen etc. ",
                            
                            
                            
                            @"Godchinamalaki Falls : The Godachinmalki Falls is a waterfall located on Markandeya river in Belgaum district, Gokak Taluk, Karnataka, India. It is 15 kilometers away from Gokak and 40 kilometers from Belgaum. It is located in a deep green valley.Godachinmalki falls, also known as Markandeya falls, is located in a rugged valley, which is approachable from Godachinamalaki village by walking as well as by vehicle through an irregular forest route for about 2 kilometers and there are two routes to rech falls from Godachinamalki, one is vai Malebail road by crossing bridge at godachinamalki and another one is vai Gurusiddeshwar Temple(Hatti Siddeshwar). It can also be reached from Nirvaneshwara Matha near Yogikolla, only by foot.To reach Godachinamalki Falls from Belgaum vai Ankalagi, Pachhapur & Mavanur, frequent bus facility is available from Belgaum & Gokak and nearest railway station is Pachhapur, which is about 8 kilometers and good train facility is available from Belgaum to Miraj, all most all trains stops in Pachhapur railway station .There are actually two falls formed here. The Markandeya river takes a first fall from a height of about 25 metres and flows into a rocky valley. After a short distance from the rocky valley, it takes the second fall from a height of about 20 metres.Within 10 km distance Gokak falls is located from Godachinamalki vai Melmanahatti & Maradimath.Later Markandeya river joins Ghataprabha river near Gokak.Within a 6 km radius there are two dams; one built across Ghataprabha river (Hidkal dam) and another one (Shirur Dam) across Markandeya river. The best time to visit these places is from June to September", nil];
    
    
    
    
    switch (recievedNumberFromView) {
        case 0:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:0]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:0]];
            
            break;
            
        case 1:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:1]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:1]];
            
            break;
           
            
        case 2:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:2]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:2]];
             break;
            
            
            
        case 3:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:3]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:3]];
            break;
            
            
        case 4:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:4]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:4]];
            break;
            
            
        case 5:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:5]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:5]];
            break;
            
            
        case 6:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:6]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:6]];
            break;
          
        case 7:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:7]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:7]];
            break;
            
        case 8:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:8]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:8]];
            break;
         
        case 9:
            self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
            self.imageLabel.image = [UIImage imageNamed:[self.ImagesOfPlace objectAtIndex:9]];
            
            self.textView.text = [NSString stringWithFormat:@"%@",[self.placeDesciption objectAtIndex:9]];
            break;
            
            
        default:
            break;
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    self.placeLebel.text = [self.namesOfPlace objectAtIndex:recievedNumberFromView];
    
    
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


-(void)getRowNumber:(int)recieveNumber{

    recievedNumberFromView = recieveNumber;
}
@end
