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
    NSMutableArray *_actionsToDelete;
}

- (id)init
{
    self = [super init];
    if (self) {
        _channels = [NSMutableDictionary new];
        _actionsToDelete = [NSMutableArray new];
        
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

- (void)unsubscribeTarget:(id)target inChannelName:(NSString *)channelName {
    NSMutableArray *actionsArray = [_channels objectForKey:channelName];
    
    NSMutableArray *actionsToRemove = [NSMutableArray new];
    
    for (WeakAction *action in actionsArray) {
        if (action.target == target) {
            [actionsToRemove addObject:action];
        }
    }
    
    [actionsArray removeObjectsInArray:actionsToRemove];
}

- (void)post:(NSString *)channelName withParameter:(id)parameter {
    NSMutableArray *actionsArray = _channels[channelName];
    
    if (!actionsArray) {
        return;
    }
    
    [_actionsToDelete removeAllObjects];
    
    for (WeakAction *weakAction in actionsArray) {
        [self tryToInvokeAction:weakAction withParameter:parameter];
    }
    
    [self removeActionsMarkedForDeletionInActionArray:actionsArray];
}

- (void)tryToInvokeAction:(WeakAction*)weakAction withParameter:(id)parameter {
    
    BOOL wasActionInvoked = [weakAction tryToInvokeActionWithParameter:parameter];
    if (!wasActionInvoked) {
        [_actionsToDelete addObject:weakAction];
    }
}

- (void)removeActionsMarkedForDeletionInActionArray:(NSMutableArray *)actionsArray {
    for (WeakAction *actionToDelete in _actionsToDelete) {
        [actionsArray removeObject:actionToDelete];
    }
}

@end
