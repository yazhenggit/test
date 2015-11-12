//
//  NewsCell.m
//  mineN
//
//  Created by 王亚征 on 15/11/9.
//  Copyright © 2015年 yazheng. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"
#import <UIImageView+AFNetworking.h>
@interface NewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titlelable;
@property (weak, nonatomic) IBOutlet UILabel *digest;
@property (weak, nonatomic) IBOutlet UILabel *posts;

@end
@implementation NewsCell
-(void)setNews:(News *)news{
    _news = news;
    self.titlelable.text = news.title;
    self.digest.text = news.digest;
    self.posts.text = [NSString stringWithFormat:@"%zd",news.posts];
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
}
- (void)awakeFromNib {
    self.digest.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(self.imageView.frame)-16;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
