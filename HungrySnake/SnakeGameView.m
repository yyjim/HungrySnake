//
//  SnakeGameView.m
//  HungrySnake
//
//  Created by yyjim on 12/9/15.
//  Copyright © 2015 cardinalblue. All rights reserved.
//

#import "Food.h"
#import "Snake.h"
#import "SnakeGameView.h"

@implementation SnakeGameView

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    Snake *snake = [self.delegate snakeForSnakeGameView:self];
    
    NSArray *points = snake.points;
    CGFloat w = self.bounds.size.width  / snake.worldSize.width;
    CGFloat h = self.bounds.size.height / snake.worldSize.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    for (NSValue *v in points) {
        CGPoint p = [v CGPointValue];
        CGRect rect = CGRectMake(w * p.x, h * p.y, w, h);
        CGContextFillRect(context, rect);
    }
    
    // Food
    Food *food = [self.delegate foodForSnakeGameView:self];
    if (food) {
        [[UIColor yellowColor] set];
        CGPoint p = food.point;
        CGRect rect = CGRectMake(w * p.x, h * p.y, w, h);
        CGContextFillEllipseInRect(context, rect);
    }
}

@end
