//
//  ViewManager.h
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 17/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewManager : NSObject

- (id)initWithSplitViewController:(UISplitViewController *)splitViewController;
- (void)switchDetailViewController:(UIViewController *)detailViewController;
- (void)preloadView;

@end
