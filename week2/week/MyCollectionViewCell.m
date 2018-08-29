//
//  MyCollectionViewCell.m
//  week
//
//  Created by 郭涛玮 on 2018/8/26.
//  Copyright © 2018年 郭涛玮. All rights reserved.
//

#import "MyCollectionViewCell.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _label.textAlignment = NSTextAlignmentCenter;
        //        _label.textColor = [UIColor blueColor];
        _label.font = [UIFont systemFontOfSize:15];
//        _label.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_label];
    }
    return self;
}

@end

