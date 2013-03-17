//
//  MasterViewController.m
//  WeakEventHub
//
//  Created by Mateusz Jamiołkowski on 17/03/2013.
//  Copyright (c) 2013 Mateusz Jamio≈Çkowski. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController {
    WeakEventHub *_eventHub;
    ViewManager *_viewManager;
    __weak IBOutlet UITextField *messageTextField;
}

- (id)initWithEventHub:(WeakEventHub*)eventHub andViewManager:(ViewManager*)viewManager;
{
    self = [super init];
    if (self) {
        _eventHub = eventHub;
        _viewManager = viewManager;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchDetailTapped:(UIButton *)sender {
    DetailViewController *detailViewController =
        [[DetailViewController alloc] initWithName:sender.titleLabel.text andEventHub:_eventHub];
    [_viewManager switchDetailViewController:detailViewController];
}

- (IBAction)sendMessageTapped:(UIButton *)sender {
    [_eventHub post:@"testMessage" withParameter:messageTextField.text];
}

@end
