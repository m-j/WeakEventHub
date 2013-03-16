//
//  EventHubTestHarness.h
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeakEventHub.h"

@interface EventHubTestHarness : NSObject

@property(readonly) int numberOfTestMethodsCalls;
@property(readonly) id lastParameterPassed;

- (id)initWithEventHub:(WeakEventHub *)eventHub;

- (void)testMethod:(id)parameter;

@end
