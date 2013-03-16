//
//  WeakEventHub.h
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakEventHub : NSObject

- (void)subscribe:(NSString *)channelName withTarget:(id)target andSelector:(SEL)selector;
- (void)post:(NSString *)channelName withParameter:(id)parameter;

@end
