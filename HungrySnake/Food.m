//
//  Food.m
//  HungrySnake
//
//  Created by yyjim on 12/9/15.
//  Copyright © 2015 cardinalblue. All rights reserved.
//

#import "Food.h"

@implementation Food

+ (instancetype)foodInWorldSize:(CGSize)worldSize
{
    return [[self alloc] initInWorldSize:worldSize];
}

- (instancetype)initInWorldSize:(CGSize)worldSize
{
    self = [self init];
    if (self) {
        _point = (CGPoint){
            .x = arc4random() % (NSInteger)worldSize.width,
            .y = arc4random() % (NSInteger)worldSize.height
        };
    }
    return self;
}

@end
