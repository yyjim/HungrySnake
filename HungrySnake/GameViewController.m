//
//  ViewController.m
//  HungrySnake
//
//  Created by yyjim on 12/9/15.
//  Copyright © 2015 cardinalblue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Snake.h"
#import "Food.h"
#import "SnakeGameView.h"
#import "GameViewController.h"

@interface GameViewController ()
    <SnakeGameViewDelegate>
@property (nonatomic, strong) Snake *snake;
@property (nonatomic, strong) Food *food;
@property (nonatomic, strong) SnakeGameView *snakeView;
@property (nonatomic, strong) NSTimer *gameTimer;
@end

@implementation GameViewController

#pragma mark - View lifecycle

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.snakeView = [[SnakeGameView alloc] init];
    self.snakeView.frame = self.view.bounds;
    self.snakeView.delegate = self;
    [self.view addSubview:self.snakeView];
    
    [self addSwipeGestureForDirection:UISwipeGestureRecognizerDirectionUp];
    [self addSwipeGestureForDirection:UISwipeGestureRecognizerDirectionDown];
    [self addSwipeGestureForDirection:UISwipeGestureRecognizerDirectionRight];
    [self addSwipeGestureForDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [self startGame];
}

#pragma mark - Setters/Getters

- (void)setGameTimer:(NSTimer *)gameTimer
{
    [_gameTimer invalidate];
    _gameTimer = gameTimer;
}

#pragma mark - Game lifecycle

- (void)startGame
{
    CGSize worldSize = CGSizeMake(15, 24);
    self.snake = [[Snake alloc] initWithWorldSize:worldSize length:10];
    self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                      target:self
                                                    selector:@selector(handleGameTimerFire:)
                                                    userInfo:nil
                                                     repeats:YES];
}

- (void)stopGame
{
    self.gameTimer = nil;
}

- (void)handleGameTimerFire:(NSTimer *)timer
{
    [self.snake move];
    
    // Check if we are dead
    if ([self.snake isDead]) {
        [self stopGame];
        // show re-start
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }

    // Check if snake gets food
    if ([self.snake.points[0] CGPointValue].x == self.food.point.x
        && [self.snake.points[0] CGPointValue].y == self.food.point.y) {
        [self.snake grow];
        
        // re-genereate food
        self.food = [Food foodInWorldSize:self.snake.worldSize];
    }
    [self.snakeView setNeedsDisplay];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self startGame];
}

#pragma mark - Gestures

- (void)addSwipeGestureForDirection:(UISwipeGestureRecognizerDirection)direction
{
    UISwipeGestureRecognizer *swipeGesture =
        [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    swipeGesture.direction = direction;
    [self.view addGestureRecognizer:swipeGesture];
}

- (void)handleSwipeGesture:(UISwipeGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"change direction: %@", @(recognizer.direction));
        switch (recognizer.direction) {
            case UISwipeGestureRecognizerDirectionUp:
                self.snake.direction = SnakeDirectionUp;
                break;
            case UISwipeGestureRecognizerDirectionDown:
                self.snake.direction = SnakeDirectionDown;
                break;
            case UISwipeGestureRecognizerDirectionLeft:
                self.snake.direction = SnakeDirectionLeft;
                break;
            case UISwipeGestureRecognizerDirectionRight:
                self.snake.direction = SnakeDirectionRight;
                break;
            default:
                break;
        }
    }
}

#pragma mark - SnakeGameViewDelegate

- (Snake *)snakeForSnakeGameView:(SnakeGameView *)snakeView
{
    return self.snake;
}

- (Food *)foodForSnakeGameView:(SnakeGameView *)snakeView
{
    return self.food;
}

@end
