//
//  T2E_MainViewController.m
//  Ton2e
//
//  Created by Skav on 10/13/13.
//  Copyright (c) 2013 Skav. All rights reserved.
//

#import "T2E_MainViewController.h"
#import "T2E_GameManager.h"
@interface T2E_MainViewController ()

@end

@implementation T2E_MainViewController
@synthesize lblResult;
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
	// Do any additional setup after loading the view.
    T2E_GameManager * game = [[T2E_GameManager alloc] initGameAndPlay:@"TestScenario"];
    [self.lblResult setText:[game getResults]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
