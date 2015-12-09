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

- (NSArray *)points
{
    return [_points copy];
}

- (void)setDirection:(SnakeDirection)direction
{
    switch (_direction) {
        case SnakeDirectionUp:
            if (direction != SnakeDirectionDown) {
                _direction = direction;
            }
            break;
        case SnakeDirectionDown:
            if (direction != SnakeDirectionUp) {
                _direction = direction;
            }
            break;
        case SnakeDirectionLeft:
            if (direction != SnakeDirectionRight) {
                _direction = direction;
            }
            break;
        case SnakeDirectionRight:
            if (direction != SnakeDirectionLeft) {
                _direction = direction;
            }
            
        default:
            break;
    }
}

- (void)move
{
    [_points removeLastObject];
    CGPoint p = [_points[0] CGPointValue];
    switch (self.direction) {
        case SnakeDirectionUp:
            if (--p.y < 0) p.y = _worldSize.height - 1;
            break;
        case SnakeDirectionDown:
            if (++p.y >= _worldSize.height) p.y = 0;
            break;
        case SnakeDirectionLeft:
            if (--p.x < 0) p.x = _worldSize.width - 1;
            break;
        case SnakeDirectionRight:
            if (++p.x >= _worldSize.width) p.x = 0;
            break;
        default:
            break;
    }
    [_points insertObject:[NSValue valueWithCGPoint:p] atIndex:0];
}

- (void)grow
{
    CGPoint p = [_points[0] CGPointValue];
    switch (self.direction) {
        case SnakeDirectionUp:
            if (--p.y < 0) p.y = _worldSize.height - 1;
            break;
        case SnakeDirectionDown:
            if (++p.y >= _worldSize.height) p.y = 0;
            break;
        case SnakeDirectionLeft:
            if (--p.x < 0) p.x = _worldSize.width - 1;
            break;
        case SnakeDirectionRight:
            if (++p.x >= _worldSize.width) p.x = 0;
            break;
            
        default:
            break;
    }
    [_points insertObject:[NSValue valueWithCGPoint:p] atIndex:0];
}

- (BOOL)isDead
{
    CGPoint p = [_points[0] CGPointValue];
    for (NSInteger i = 1; i < _points.count; i++) {
        if (p.x == [_points[i] CGPointValue].x && p.y == [_points[i] CGPointValue].y) {
            return YES;
        }
    }
    return NO;
}

@end
