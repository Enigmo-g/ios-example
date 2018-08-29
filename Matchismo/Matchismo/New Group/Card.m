//
//  Card.m
//  Matchismo
//
//  Created by 郭涛玮 on 2018/8/17.
//  Copyright © 2018年 郭涛玮. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
