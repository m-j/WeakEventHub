//
//  DetailViewController.h
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 17/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeakEventHub.h"

@interface DetailViewController : UIViewController

- (id)initWithName:(NSString *)name andEventHub:(WeakEventHub *)eventHub;

@end
