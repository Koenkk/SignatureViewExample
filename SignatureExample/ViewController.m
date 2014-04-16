//
//  ViewController.m
//  SignatureExample
//
//  Created by John Montiel on 6/18/12.
//  Copyright (c) 2012 Em Sevn, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *signatureView;
@property (strong, nonatomic) IBOutlet UIView *signatureView1;
@property (strong, nonatomic) SignatureViewController *signatureController;
@property (strong, nonatomic) SignatureViewController *signatureController1;

@end

@implementation ViewController
@synthesize signatureView;
@synthesize signatureController;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.signatureController = [[SignatureViewController alloc] initWithNibName:@"SignatureView" bundle:nil];
    self.signatureController.delegate = self;
    self.signatureController.view.frame = self.signatureView.frame;
    [self.view insertSubview:self.signatureController.view belowSubview:self.signatureView];
    [self.signatureView removeFromSuperview];
    self.signatureView = self.signatureController.view;
    
    self.signatureController1 = [[SignatureViewController alloc] initWithNibName:@"SignatureView" bundle:nil];
    self.signatureController1.delegate = self;
    self.signatureController1.view.frame = self.signatureView1.frame;
    [self.view insertSubview:self.signatureController1.view belowSubview:self.signatureView1];
    [self.signatureView1 removeFromSuperview];
    self.signatureView1 = self.signatureController1.view;
}

- (void)viewDidUnload
{
    [self setSignatureView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) 
    {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
    else 
    {
        return YES;
    }
}

#pragma mark SignatureViewController delegate methods
- (void) signatureViewController:(SignatureViewController *)viewController didSign:(NSData *)signatureData;
{
    NSLog(@"signatureData: %@",signatureData.description);
}


@end
