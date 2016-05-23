//
//  FriendGroupCell.m
//  InstantMessage
//
//  Created by 林英伟 on 15/12/8.
//  Copyright © 2015年 林英伟. All rights reserved.
//


@interface FriendGroupCell ()
@property (nonatomic,strong) UIImageView *headImg;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *introLabel;
@property (nonatomic,strong) UIImageView *netStatus;
@end
@implementation FriendGroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    [self setup];
    return self;
}

- (void)setup
{
    UIImageView *headImg = [[UIImageView alloc]init];
    headImg.backgroundColor = [UIColor redColor];
    self.headImg = headImg;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = [UIFont systemFontOfSize:17];
    self.nameLabel = nameLabel;
    
    UILabel *introLabel = [[UILabel alloc]init];
    introLabel.textColor = [UIColor grayColor];
    introLabel.font = [UIFont systemFontOfSize:14];
    self.introLabel = introLabel;
    
//    UIImageView *netStatus = [[UIImageView alloc]init];
//    netStatus.backgroundColor = [UIColor yellowColor];
//    self.netStatus = netStatus;
    
    [self.contentView addSubview:headImg];
    [self.contentView addSubview:nameLabel];
    [self.contentView addSubview:introLabel];
//    [self.contentView addSubview:netStatus];
    
    self.headImg.sd_layout
    .widthIs(40)
    .heightIs(40)
    .topSpaceToView(self.contentView,10)
    .leftSpaceToView(self.contentView,10);
    
    self.nameLabel.sd_layout
    .topEqualToView(self.headImg)
    .leftSpaceToView(self.headImg,10)
    .rightSpaceToView(self.contentView,35)
    .heightRatioToView(self.headImg,0.4);
    
    self.introLabel.sd_layout
    .topSpaceToView(self.nameLabel,10)
    .rightSpaceToView(self.contentView,35)
    .leftEqualToView(self.nameLabel)
    .heightRatioToView(self.headImg,0.4);
    
//    self.netStatus.sd_layout
//    .topSpaceToView(self.contentView,10)
//    .rightSpaceToView(self.contentView,10)
//    .leftSpaceToView(self.introLabel,10)
//    .heightIs(15);
}

- (void)setFriends:(Friend *)friends
{
    _friends = friends;
    _headImg.layer.masksToBounds = YES;
    _headImg.layer.cornerRadius = _headImg.frame.size.width * 0.5;
    
    _headImg.image = [UIImage imageNamed:friends.icon];
    
    _nameLabel.textColor = friends.isVip ? [UIColor redColor] : [UIColor blackColor];
    
    _nameLabel.text = friends.name;
    
    _introLabel.text = friends.intro;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
