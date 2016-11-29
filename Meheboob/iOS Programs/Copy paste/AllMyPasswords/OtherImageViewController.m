//
//  OtherImageViewController.m
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 24/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "OtherImageViewController.h"
#import "OtherCollectionViewCell.h"
#import "AppDelegate.h"

@interface OtherImageViewController ()
@property(strong,nonatomic)NSArray*imageArray;
@end

@implementation OtherImageViewController

{
    
    NSIndexPath *recivedIndexPath;
    NSArray *employeeObjects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self fetchData];
   self.imageArray = [[NSArray alloc] initWithObjects:@"100",@"101",@"102",@"103",@"104",@"105",@"106",@"107",@"108",@"109",@"110",@"111",@"112",@"113",@"114",@"115",@"116",@"117",@"118",@"119",@"120",@"121",@"122",@"123",@"124",@"125",@"126",@"127",@"128",@"129",@"130",@"131",@"132",@"133",@"134",@"135",@"136",@"137",@"138",@"139",@"140", nil];
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
    
    OtherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
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
        
       NSString *imageName = [NSString stringWithFormat:@"%@.jpg",[self.imageArray objectAtIndex:indexPath.row]];
        
        
        [employeeObject setValue:imageName forKey:@"imageName"];
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
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"AllPasswordsDetail"];
    NSError* error=nil;
    
    employeeObjects=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    
    
    
}


-(NSManagedObjectContext *)getContext{
    
    AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App persistentContainer].viewContext;
    
    return context;
    
}
@end
