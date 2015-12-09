//
//  Food.h
//  HungrySnake
//
//  Created by yyjim on 12/9/15.
//  Copyright © 2015 cardinalblue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject
@property (nonatomic) CGPoint point;

+ (instancetype)foodInWorldSize:(CGSize)worldSize;
@end
