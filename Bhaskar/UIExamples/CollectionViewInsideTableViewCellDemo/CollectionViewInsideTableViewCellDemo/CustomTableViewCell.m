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
 
    
}
-(void)prepareForReuse
{
    self.contentView.bounds=self.contentView.bounds;
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
