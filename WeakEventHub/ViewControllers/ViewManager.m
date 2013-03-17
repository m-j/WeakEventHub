//
//  ViewManager.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 17/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "ViewManager.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import "WeakEventHub.h"

@implementation ViewManager{
    UISplitViewController *_splitViewController;
    MasterViewController *_masterViewController;
    WeakEventHub *_eventHub;
}

- (id)initWithSplitViewController:(UISplitViewController *)splitViewController
{
    self = [super init];
    if (self) {
        _splitViewController = splitViewController;
        _eventHub = [[WeakEventHub alloc] init];
    }
    
    return self;
}

- (void)preloadView {
    
    _masterViewController = [[MasterViewController alloc] initWithEventHub:_eventHub andViewManager:self];
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithName:@"Start" andEventHub:_eventHub];
    
    _splitViewController.viewControllers =
        @[_masterViewController, detailViewController];
}

- (void)switchDetailViewController:(UIViewController *)detailViewController {
    _splitViewController.viewControllers = @[_masterViewController, detailViewController];
}

@end
