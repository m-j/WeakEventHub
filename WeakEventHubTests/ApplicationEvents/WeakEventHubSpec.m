//
//  WeakEventHubSpec.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "Kiwi.h"
#import "WeakEventHub.h"
#import "EventHubTestHarness.h"

SPEC_BEGIN(WeakEventHubSpec)

describe(@"WeakEventHub", ^{
    describe(@"when having subscribents", ^{
        NSString *testChannel = @"testChannel";
        __block WeakEventHub *eventHub;
        __block EventHubTestHarness *testHarness1;
        __block EventHubTestHarness *testHarness2;
        
        beforeEach(^{
            eventHub = [[WeakEventHub alloc] init];
            
            testHarness1 = [[EventHubTestHarness alloc] initWithEventHub:eventHub];
            testHarness2 = [[EventHubTestHarness alloc] initWithEventHub:eventHub];
            
            [eventHub subscribe:testChannel
                     withTarget:testHarness1 andSelector:@selector(testMethod:)];
            [eventHub subscribe:testChannel
                     withTarget:testHarness2 andSelector:@selector(testMethod:)];
        });
        
//        it(@"should call all subscibed selectors", ^{
//            [eventHub post:testChannel withParameter:nil];
//            
//            [[theValue(testHarness1.numberOfTestMethodsCalls) should] equal:theValue(1)];
//            [[theValue(testHarness1.numberOfTestMethodsCalls) should] equal:theValue(1)];
//        });
    });
});

SPEC_END