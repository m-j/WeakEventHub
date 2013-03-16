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
#import "WeakActionMock.h"

SPEC_BEGIN(WeakEventHubSpec)

describe(@"WeakEventHub", ^{
    __block WeakEventHub *eventHub;
    NSString *testChannel = @"testChannel";
    
    beforeEach(^{
        eventHub = [[WeakEventHub alloc] init];
    });
    
    describe(@"when having subscribents", ^{
        __block EventHubTestHarness *testHarness1;
        __block EventHubTestHarness *testHarness2;
        
        beforeEach(^{
            
            testHarness1 = [[EventHubTestHarness alloc] initWithEventHub:eventHub];
            testHarness2 = [[EventHubTestHarness alloc] initWithEventHub:eventHub];
            
            [eventHub subscribe:testChannel
                    withAction:[WeakAction newWithTarget:testHarness1 andSelector:@selector(testMethod:)]];
            
            [eventHub subscribe:testChannel
                     withAction:[WeakAction newWithTarget:testHarness2 andSelector:@selector(testMethod:)]];
        });
        
        it(@"should call all subscibed selectors", ^{
            [eventHub post:testChannel withParameter:nil];
            [eventHub post:testChannel withParameter:nil];
            
            [[theValue(testHarness1.numberOfTestMethodsCalls) should] equal:theValue(2)];
            [[theValue(testHarness1.numberOfTestMethodsCalls) should] equal:theValue(2)];
        });
    });
    
    describe(@"when having deallocated subscribents", ^{
        it(@"should try to call them only once", ^{
            WeakActionMock *actionMock = [WeakActionMock new];
            
            [eventHub subscribe:testChannel withAction:actionMock];
            
            [eventHub post:testChannel withParameter:nil];
            [eventHub post:testChannel withParameter:nil];
            
            [[theValue(actionMock.numberOfTryToInvokeInvokations) should] equal:theValue(1)];
        });
    });
});

SPEC_END