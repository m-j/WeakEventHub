//
//  MasterViewController.h
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 17/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeakEventHub.h"
#import "ViewManager.h"

@interface MasterViewController : UIViewController

- (id)initWithEventHub:(WeakEventHub*)eventHub andViewManager:(ViewManager*)viewManager;

@end
