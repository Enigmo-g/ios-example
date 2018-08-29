//
//  PlayingCard.h
//  Matchismo
//
//  Created by 郭涛玮 on 2018/8/17.
//  Copyright © 2018年 郭涛玮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)rankStrings;
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
