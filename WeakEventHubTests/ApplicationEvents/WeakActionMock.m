//
//  WeakActionMock.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "WeakActionMock.h"

@implementation WeakActionMock

@synthesize numberOfTryToInvokeInvokations = _numberOfTryToInvokeInvokations;

- (id)init
{
    self = [super init];
    if (self) {
        _numberOfTryToInvokeInvokations = 0;
    }
    return self;
}

-(BOOL)tryToInvokeActionWithParameter:(id)parameter {
    _numberOfTryToInvokeInvokations++;
    
    return NO;
}

@end
