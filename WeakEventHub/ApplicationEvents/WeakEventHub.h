//
//  WeakEventHub.h
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeakAction.h"

@interface WeakEventHub : NSObject

- (void)unsubscribeTarget:(id)target inChannelName:(NSString *)channelName;
- (void)subscribe:(NSString *)channelName withAction:(WeakAction *)action;
- (void)post:(NSString *)channelName withParameter:(id)parameter;

@end
