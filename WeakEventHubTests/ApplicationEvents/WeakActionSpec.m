//
//  WeakActionSpec.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "Kiwi.h"
#import "WeakAction.h"
#import "EventHubTestHarness.h"

SPEC_BEGIN(WeakActionSpec)

describe(@"WeakActon", ^{
    describe(@"exploratory", ^{
        it(@"should increase retain count when assigning to variable", ^{
            NSObject *testTarget = [NSObject new];
            
            CFIndex initialRetainCount = CFGetRetainCount((__bridge CFTypeRef)testTarget);
            __strong NSObject *objectReference = testTarget;
            CFIndex finalRetainCount = CFGetRetainCount((__bridge CFTypeRef)testTarget);
            
            [[theValue(initialRetainCount) shouldNot] equal:theValue(finalRetainCount)];
        });
        
//        it(@"should clean weak reference", ^{
//            __strong NSObject *strongRef = [NSObject new];
//            __weak NSObject *weakRef = strongRef;
//            
//            [weakRef shouldNotBeNil];
//            strongRef = nil;
//            [weakRef shouldBeNil];
//        });
    });
    
    it(@"should not increase referenece counter for provided target", ^{
        NSObject *testTarget = [NSObject new];
        
        CFIndex initialRetainCount = CFGetRetainCount((__bridge CFTypeRef)testTarget);
        __strong WeakAction *weakAction =
            [[WeakAction alloc] initWithTarget:testTarget andSelector:@selector(description)];

        CFIndex finalRetainCount = CFGetRetainCount((__bridge CFTypeRef)testTarget);
        
        [[theValue(initialRetainCount) should] equal:theValue(finalRetainCount)];
    });
    
    describe(@"when invoking", ^{
        __block WeakAction *action;
        __block EventHubTestHarness *testHarness;
        NSString *testArgument = @"testArgument";
        
        describe(@"with valid target", ^{
            beforeEach(^{
                testHarness = [EventHubTestHarness new];
                action = [[WeakAction alloc]
                          initWithTarget:testHarness andSelector:@selector(testMethod:)];
            });

            
            it(@"should perform selector on given target", ^{
                [action tryToInvokeActionWithParameter:nil];
                [[theValue(testHarness.numberOfTestMethodsCalls) should] equal:theValue(1)];
            });
            
            it(@"should pass parameter", ^{
                [action tryToInvokeActionWithParameter:testArgument];
                [[testHarness.lastParameterPassed should] equal:testArgument];
            });
            
            it(@"should return YES", ^{
                BOOL wasAbleToInvoke = [action tryToInvokeActionWithParameter:testArgument];
                [[theValue(wasAbleToInvoke) should] beTrue];
            });
        });
        
        describe(@"with invalid target", ^{
            beforeEach(^{
                action = [[WeakAction alloc]
                          initWithTarget:nil andSelector:@selector(testMethod:)];
            });
            
            it(@"should return NO", ^{
                BOOL wasAbleToInvoke = [action tryToInvokeActionWithParameter:testArgument];
                [[theValue(wasAbleToInvoke) should] beFalse];
            });
        });
    });
    

});

SPEC_END