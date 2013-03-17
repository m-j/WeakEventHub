//
//  DetailViewController.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 17/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController {
    NSString *_viewName;
    WeakEventHub *_eventHub;
    __weak IBOutlet UILabel *viewNameLabel;
    __weak IBOutlet UILabel *messageLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithName:(NSString *)name andEventHub:(WeakEventHub *)eventHub
{
    self = [self initWithNibName:@"DetailViewController" bundle:nil];
    if (self) {
        _viewName = name;
        _eventHub = eventHub;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    viewNameLabel.text = _viewName;
    [_eventHub subscribe:@"testMessage" withAction:[WeakAction newWithTarget:self andSelector:@selector(recievedMessage:)]];
}

- (void)recievedMessage:(id)parameter {
    messageLabel.text = parameter;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"Deallocating view: %@", _viewName);
}

@end
