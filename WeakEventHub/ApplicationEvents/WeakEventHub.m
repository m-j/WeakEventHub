//
//  WeakEventHub.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 16/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "WeakEventHub.h"

@implementation WeakEventHub {
    NSDictionary *_channels;
}

- (id)init
{
    self = [super init];
    if (self) {
        _channels = [NSDictionary new];
    }
    return self;
}

-(void)subscribe:(NSString *)channelName withTarget:(id)target andSelector:(SEL)selector {
    
}

- (void)post:(NSString *)channelName withParameter:(id)parameter {
    
}

@end
