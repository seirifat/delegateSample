//
//  ChildViewController.h
//  delegateSample
//
//  Created by Rifat Firdaus on 6/11/15.
//  Copyright (c) 2015 Rifat Firdaus. All rights reserved.
//

#import <UIKit/UIKit.h>

//1. buat protocol --
@protocol ChildViewControllerDelegate;

@interface ChildViewController : UIViewController

@property (nonatomic,weak) id<ChildViewControllerDelegate> delegate;

@end

// 3. definisikan interface delegate
@protocol ChildViewControllerDelegate <NSObject>

-(void)childViewController:(ChildViewController *)viewController didChooseValue:(NSString*)value;

@end
