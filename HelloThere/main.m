//
//  main.m
//  HelloThere
//
//  Created by Thomas DE BONA on 26/08/2014.
//  Copyright (c) 2014 debona. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "_AppDelegate.h"

#ifdef DEBUG

#import <objc/runtime.h>
#import <objc/message.h>

#define SWIZZLE_LOG(str) NSLog([NSString stringWithFormat:@"\t\t\t%@ %@", self , str])

@interface UIViewController (LOG)

- (void)loadView_LOG;
- (void)viewDidLoad_LOG;
- (void)viewDidUnload_LOG;

- (void)viewWillAppear_LOG:(BOOL)animated;
- (void)viewDidAppear_LOG:(BOOL)animated;

- (void)viewWillDisappear_LOG:(BOOL)animated;
- (void)viewDidDisappear_LOG:(BOOL)animated;

@end

@implementation UIViewController (LOG)

- (void) loadView_LOG {
    SWIZZLE_LOG(@"loadView");
    [self loadView_LOG];
}

- (void)viewDidLoad_LOG {
    SWIZZLE_LOG(@"viewDidLoad");
    [self viewDidLoad_LOG];
}

- (void)viewDidUnload_LOG {
    SWIZZLE_LOG(@"viewDidUnload");
    [self viewDidUnload_LOG];
}

- (void)viewWillAppear_LOG:(BOOL)animated {
    SWIZZLE_LOG(@"viewWillAppear");
    [self viewWillAppear_LOG:animated];
}

- (void)viewDidAppear_LOG:(BOOL)animated {
    SWIZZLE_LOG(@"viewDidAppear");
    [self viewDidAppear_LOG:animated];
}

- (void)viewWillDisappear_LOG:(BOOL)animated {
    SWIZZLE_LOG(@"viewWillDisappear");
    [self viewWillDisappear_LOG:animated];
}

- (void)viewDidDisappear_LOG:(BOOL)animated {
    SWIZZLE_LOG(@"viewDidDisappear");
    [self viewDidDisappear_LOG:animated];
}

@end

void swizzle(Class c, SEL orig, SEL new) {
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);

    if(class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}

void swizzle_hack() {
    NSLog(@"SWIZZLING enabled");

    swizzle([UIViewController class], @selector(loadView), @selector(loadView_LOG));
    swizzle([UIViewController class], @selector(viewDidLoad), @selector(viewDidLoad_LOG));
    swizzle([UIViewController class], @selector(viewDidUnload), @selector(viewDidUnload_LOG));

    swizzle([UIViewController class], @selector(viewWillAppear:), @selector(viewWillAppear_LOG:));
    swizzle([UIViewController class], @selector(viewDidAppear:), @selector(viewDidAppear_LOG:));

    swizzle([UIViewController class], @selector(viewWillDisappear:), @selector(viewWillDisappear_LOG:));
    swizzle([UIViewController class], @selector(viewDidDisappear:), @selector(viewDidDisappear_LOG:));
}

#endif


int main(int argc, char * argv[])
{

#ifdef DEBUG
    swizzle_hack();
#endif

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([_AppDelegate class]));
    }
}
