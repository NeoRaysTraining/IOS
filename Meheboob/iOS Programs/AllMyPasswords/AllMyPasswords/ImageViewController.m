//
//  ImageViewController.m
//  AllMyPasswords
//
//  Created by test on 11/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ImageViewController.h"
#import "CollectionViewCell.h"
#import "AllPasswords.h"
@interface ImageViewController ()
@property(strong,nonatomic)NSArray*imageArray;
@end

@implementation ImageViewController{

    NSIndexPath *recivedIndexPath;
    NSArray *employeeObjects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchData];
    self.imageArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

   CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[self.imageArray objectAtIndex:indexPath.row]]];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        
        
        
        // Cancel button tappped do nothing.
        
    }]];
    
     [actionSheet addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
         
          NSManagedObjectContext* context=[self getContext];
           NSManagedObject *employeeObject =[ employeeObjects objectAtIndex:recivedIndexPath.row];
         
         UIImage *imageLogo = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[self.imageArray objectAtIndex:indexPath.row]]];
         
         NSData *imageData = UIImagePNGRepresentation(imageLogo);
         [employeeObject setValue:imageData forKey:@"picture"];
         NSError* error=nil;
         
         if (![context save:&error
               ]) {
             NSLog(@"Failed to save data");
         }
         else{
             
             NSLog(@"Saved Data");
         }
         
         [self dismissViewControllerAnimated:YES completion:nil];

}]];

     [self presentViewController:actionSheet animated:YES completion:nil];
}

- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)revieweTableIndex:(NSIndexPath*)tableIndex{

    recivedIndexPath = tableIndex;
    NSLog(@"Recieved Index : %@",tableIndex);
}

-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"AllPasswords"];
    NSError* error=nil;
    
  employeeObjects=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    
    
    
}


-(NSManagedObjectContext *)getContext{
    
    AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App persistentContainer].viewContext;
    
    return context;
    
}
@end
