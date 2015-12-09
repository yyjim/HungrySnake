//
//  Snake.m
//  HungrySnake
//
//  Created by yyjim on 12/9/15.
//  Copyright © 2015 cardinalblue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Snake.h"

@implementation Snake
{
    CGSize _worldSize;
    NSMutableArray<NSValue *>*_points;
}

- (instancetype)initWithWorldSize:(CGSize)worldSize length:(NSInteger)length
{
    self = [super init];
    if (self) {
        _worldSize = worldSize;
        _points = [NSMutableArray array];
        for (NSInteger i = 0; i < length; i++) {
            CGPoint point = CGPointMake(0 + i, 1);
            [_points addObject:[NSValue valueWithCGPoint:point]];
        }
    }
    return self;
}

- (void)setDirection:(SnakeDirection)direction
{
}

- (void)move
{
}

- (void)grow
{
}

- (BOOL)isDead
{
}

@end
