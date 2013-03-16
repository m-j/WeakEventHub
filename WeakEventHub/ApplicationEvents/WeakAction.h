//
//  WeakAction.h
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakAction : NSObject

@property(readonly) id target;
@property(readonly) SEL selector;

- (id)initWithTarget:(id)target andSelector:(SEL)selector;
+ (id)newWithTarget:(id)target andSelector:(SEL)selector;

- (BOOL)tryToInvokeActionWithParameter:(id)parameter;

@end
