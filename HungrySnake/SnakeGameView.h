//
//  SnakeGameView.h
//  HungrySnake
//
//  Created by yyjim on 12/9/15.
//  Copyright © 2015 cardinalblue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Food;
@class Snake;
@class SnakeGameView;
@protocol SnakeGameViewDelegate
- (Snake *)snakeForSnakeGameView:(SnakeGameView *)snakeView;
- (Food *)foodForSnakeGameView:(SnakeGameView *)snakeView;
@end

@interface SnakeGameView : UIView
@property (nonatomic, weak) id<SnakeGameViewDelegate> delegate;
@end
