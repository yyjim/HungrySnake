//
//  Snake.h
//  HungrySnake
//
//  Created by yyjim on 12/9/15.
//  Copyright © 2015 cardinalblue. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SnakeDirection) {
    SnakeDirectionUp,
    SnakeDirectionLeft,
    SnakeDirectionRight,
    SnakeDirectionDown,
};

@interface Snake : NSObject
@property (nonatomic, readonly) CGSize worldSize;
@property (nonatomic) NSArray *points;
@property (nonatomic) SnakeDirection direction;

- (instancetype)initWithWorldSize:(CGSize)worldSize length:(NSInteger)length;

- (void)move;
- (void)grow;
- (BOOL)isDead;
@end
