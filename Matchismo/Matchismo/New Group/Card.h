//
//  Card.h
//  Matchismo
//
//  Created by 郭涛玮 on 2018/8/17.
//  Copyright © 2018年 郭涛玮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;




@end
