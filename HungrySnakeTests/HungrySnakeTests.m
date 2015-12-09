//
//  HungrySnakeTests.m
//  HungrySnakeTests
//
//  Created by yyjim on 12/9/15.
//  Copyright © 2015 cardinalblue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Snake.h"

@interface HungrySnakeTests : XCTestCase
@property (nonatomic) Snake *snake;
@end

@implementation HungrySnakeTests

- (void)setUp
{
    [super setUp];
    self.snake = [[Snake alloc] initWithWorldSize:CGSizeMake(15,24) length:2];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDirection
{
    // Default direction to Left
    self.snake.direction = SnakeDirectionLeft;
    
    // Change left to right
    self.snake.direction = SnakeDirectionRight;
    XCTAssertEqual(self.snake.direction, SnakeDirectionLeft, @"must be left still");
    
    // Change left to up
    self.snake.direction = SnakeDirectionUp;
    XCTAssertEqual(self.snake.direction, SnakeDirectionUp, @"must be up");
    
    // Change up to down
    self.snake.direction = SnakeDirectionDown;
    XCTAssertEqual(self.snake.direction, SnakeDirectionUp, @"must be up still");
    
    // Change down to right
    self.snake.direction = SnakeDirectionRight;
    XCTAssertEqual(self.snake.direction, SnakeDirectionRight, @"must be right");
    
    // Change right to down
    self.snake.direction = SnakeDirectionDown;
    XCTAssertEqual(self.snake.direction, SnakeDirectionDown, @"must be down");
}

- (void)testSnakeGrow
{
    XCTAssertEqual([self.snake.points count], (NSUInteger)2, @"must be 2 by default");
    
    [self.snake grow];
    XCTAssertEqual([self.snake.points count], (NSUInteger)3, @"must be 3");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
