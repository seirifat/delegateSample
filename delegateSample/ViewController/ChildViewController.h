//
//  ChildViewController.h
//  delegateSample
//
//  Created by Rifat Firdaus on 6/11/15.
//  Copyright (c) 2015 Rifat Firdaus. All rights reserved.
//

#import <UIKit/UIKit.h>

//1. buat protocol --ini bukan obat flu
@protocol ChildViewControllerDelegate;

@interface ChildViewController : UIViewController

@property (nonatomic,weak) id<ChildViewControllerDelegate> delegate;

@end
