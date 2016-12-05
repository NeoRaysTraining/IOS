//
//  CustomTableViewCell.m
//  CollectionViewInsideTableViewCellDemo
//
//  Created by test on 12/5/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation AFIndexedCollectionView

@end
@interface CustomTableViewCell()



@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    self.collectionViewOutlet.backgroundColor=[UIColor whiteColor];
//    
//    [self.collectionViewOutlet registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
}

-(void)layoutSubviews
{
    self.collectionViewOutlet.frame=self.contentView.bounds;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (!(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) return nil;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 9, 10);
    layout.itemSize = CGSizeMake(44, 44);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionViewOutlet = [[AFIndexedCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionViewOutlet registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
    self.collectionViewOutlet.backgroundColor = [UIColor whiteColor];
    self.collectionViewOutlet.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.collectionViewOutlet];
    
    return self;

}


//-(id)initWithCoder:(NSCoder*)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    
//    if(self)
//    {
//        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        flowLayout.itemSize = CGSizeMake(100, 100);
//        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//        self.collectionViewOutlet = [[UICollectionView alloc] initWithFrame:self.contentView.frame collectionViewLayout:flowLayout];
//        [self.collectionViewOutlet registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
//        self.collectionViewOutlet.delegate=self;
//        self.collectionViewOutlet.dataSource=self;
//        
//        [self.contentView addSubview:self.collectionViewOutlet];
//    }
//    
//    return self;
//}
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.collectionViewOutlet =[[UICollectionView alloc]init];
//        self.collectionViewOutlet.delegate=self;
//        self.collectionViewOutlet.dataSource=self;
//        
//        [self.contentView addSubview:self.collectionViewOutlet];
//    }
//    return self;
//}


#pragma mark collectionview delegagte mathods

//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}
//
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//{
//    return [self.itemArray count];
//}
//
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    CustomCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collcetionCell" forIndexPath:indexPath];
//    cell.itemLbl.text=self.itemArray[indexPath.row];
//    
//    return cell;
//}

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource,UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionViewOutlet.dataSource = dataSourceDelegate;
    self.collectionViewOutlet.delegate = dataSourceDelegate;
    self.collectionViewOutlet.indexPath = indexPath;
    [self.collectionViewOutlet setContentOffset:self.collectionViewOutlet.contentOffset animated:NO];
    
    [self.collectionViewOutlet reloadData];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
