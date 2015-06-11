//
//  ParentViewController.m
//  delegateSample
//
//  Created by Rifat Firdaus on 6/11/15.
//  Copyright (c) 2015 Rifat Firdaus. All rights reserved.
//

#import "ParentViewController.h"
#import "ChildViewController.h"

@interface ParentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tfLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnCompose;
-(IBAction)btnCompposeClk:(id)sender;
@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"Delegate View Cominication"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)childViewController:(ChildViewController *)viewController didChooseValue:(NSString *)value{
    _tfLabel.text = value;
}

-(void)btnCompposeClk:(id)sender{
    ChildViewController *c2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ChildViewController"];
    c2.delegate = self;
    [self.navigationController pushViewController:c2 animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
