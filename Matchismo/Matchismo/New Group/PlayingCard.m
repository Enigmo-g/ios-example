//
//  PlayingCard.m
//  Matchismo
//
//  Created by 郭涛玮 on 2018/8/17.
//  Copyright © 2018年 郭涛玮. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray *)validSuits {
    return @[@"♥️", @"♦️", @"♠️", @"♣️"];
}

+ (NSUInteger)maxRank {
    return [[self rankStrings] count] - 1;
}

- (int)match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] == 1) {
        id card = [otherCards firstObject];
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)card;
            if ([otherCard.suit isEqualToString:self.suit]) {
                score = 1;
            } else if (otherCard.rank == self.rank) {
                score = 4;
            }
        }
    }
    return score;
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
//    return [NSString stringWithFormat:@"%d%@", self.rank, self.suit];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;
- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard
          validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
