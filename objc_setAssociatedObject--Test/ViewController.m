//
//  ViewController.m
//  objc_setAssociatedObject--Test
//
//  Created by Sinosoft on 9/17/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

static char alertInfoKey;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    NSString* dataYouWantToPass = @"some info";
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"hello" message:@"miss-chalk" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"YES", nil];
    [alert show];
    objc_setAssociatedObject(alert, &alertInfoKey, dataYouWantToPass, OBJC_ASSOCIATION_RETAIN);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* data = objc_getAssociatedObject(alertView, &alertInfoKey);
    NSLog(@"%@",data);
}
@end
