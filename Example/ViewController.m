//
//  ViewController.m
//  Example
//
//  Created by ducai on 2015/6/26.
//  Copyright © 2015 ducai. All rights reserved.
//

#import "ViewController.h"
#import "DCUtilities.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (@available(iOS 11.0, *)) {
        NSLog(@"%@", NSStringFromUIEdgeInsets(SAFEAREA_INSETS));
        NSLog(@"%f", SAFEAREA_BOTTOM);
        NSLog(@"%f", HEIGHT_BOTTOMBAR);
    }
    
    NSLog(@"%f", HEIGHT_STATUSBAR);
    NSLog(@"%f", HEIGHT_NAVIBAR);
    NSLog(@"%f", HEIGHT_TOPBAR);
    NSLog(@"%@", NSStringFromCGSize(SIZE_SCREEN));
    NSLog(@"%f", WIDTH_SCREEN);
    NSLog(@"%f", HEIGHT_SCREEN);
    
    NSLog(@"%@", RGB(100.f, 100.f, 100.f));
    NSLog(@"%@", RGBA(10.f, 10.f, 10.f, .5f));
    NSLog(@"%@", RANDOMCOLOR);
    
    USERDEFAULTS_INT_SET(@"example_int", 0)
    USERDEFAULTS_BOOL_SET(@"example_bool", NO)
    USERDEFAULTS_OBJ_SET(@"example_obj", @"1")
    
    NSLog(@"%ld", (long)USERDEFAULTS_INT(@"example_int"));
    NSLog(@"%d", USERDEFAULTS_BOOL(@"example_bool"));
    NSLog(@"%@", USERDEFAULTS_OBJ(@"example_obj"));
    
    NSLog(@"%@", PATHDOCUMENT);
    NSLog(@"%@", PATHDOWNLOAD);
    NSLog(@"%@", TEST);
    
    NSLog(@"%@", DEVICETYPE);
    NSLog(@"%ld", (long)DEVICEIDIOM);
    
    NSLog(@"%@", SYSTEMVERSION);
}


@end
