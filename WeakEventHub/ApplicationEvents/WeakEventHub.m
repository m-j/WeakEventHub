//
//  WeakEventHub.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "WeakEventHub.h"
#import "WeakAction.h"

@implementation WeakEventHub {
    NSMutableDictionary *_channels;
}

- (id)init
{
    self = [super init];
    if (self) {
        _channels = [NSMutableDictionary new];
    }
    return self;
}

- (void)subscribe:(NSString *)channelName withAction:(WeakAction *)action {
    NSMutableArray *actionsArray = _channels[channelName];
    
    if (!actionsArray) {
        actionsArray = [NSMutableArray new];
        _channels[channelName] = actionsArray;
    }
    
    [actionsArray addObject:action];
}

- (void)post:(NSString *)channelName withParameter:(id)parameter {
    NSMutableArray *actionsArray = _channels[channelName];
    
    if (!actionsArray) {
        return;
    }
    
    NSMutableArray *actionsToDelete = [NSMutableArray new];
    
    for (WeakAction *weakAction in actionsArray) {
        BOOL wasActionInvoked = [weakAction tryToInvokeActionWithParameter:parameter];
        if (!wasActionInvoked) {
            [actionsToDelete addObject:weakAction];
        }
    }
}

@end
