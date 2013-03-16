//
//  EventHubTestHarness.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "EventHubTestHarness.h"

@implementation EventHubTestHarness {
    WeakEventHub *_eventHub;
}

@synthesize numberOfTestMethodsCalls = _testMethodNumberOfCalls;
@synthesize lastParameterPassed = _lastParameterPassed;

- (id)initWithEventHub:(WeakEventHub *)eventHub
{
    self = [super init];
    if (self) {
        _eventHub = eventHub;
        _testMethodNumberOfCalls = 0;
    }
    return self;
}

- (void)testMethod:(id)parameter {
    _lastParameterPassed = parameter;
    _testMethodNumberOfCalls++;
}

@end
