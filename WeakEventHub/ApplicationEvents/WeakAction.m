//
//  WeakAction.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "WeakAction.h"

@implementation WeakAction {
    __weak id _target;
    SEL _selector;
}

- (id)initWithTarget:(id)target andSelector:(SEL)selector
{
    self = [super init];
    if (self) {
        _target = target;
        _selector = selector;
    }
    return self;
}

+ (id)newWithTarget:(id)target andSelector:(SEL)selector{
    return [[WeakAction alloc] initWithTarget:target andSelector:selector];
}

- (BOOL)tryToInvokeActionWithParameter:(id)parameter {
    if (!self.target) {
        return NO;
    }
    else {
        [self.target performSelector:self.selector withObject:parameter];
        return YES;
    }
}

@end
