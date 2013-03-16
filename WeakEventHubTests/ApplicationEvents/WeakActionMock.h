//
//  WeakActionMock.h
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeakAction.h"

@interface WeakActionMock : WeakAction

@property(readonly) int numberOfTryToInvokeInvokations;

@end
