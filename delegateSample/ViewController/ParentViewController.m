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
@property (weak, nonatomic) IBOutlet UIButton *btnSetNama;
-(IBAction)btnCompposeClk:(id)sender;
-(IBAction)btnSetNamaClk:(id)sender;
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
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Alert"
                                                   message: @"Sure?"
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    
    [alert setTag:1];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1) { // UIAlertView with tag 1 detected
        if (buttonIndex == 0)
        {
            //NSLog(@"user pressed Button Indexed 0");
            
        }
        else
        {
            //NSLog(@"user pressed Button Indexed 1");
            
            [self.navigationController popViewControllerAnimated:true];
            
        }
    }
}

-(void)btnCompposeClk:(id)sender{
    ChildViewController *c2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ChildViewController"];
    c2.delegate = self;
    [self.navigationController pushViewController:c2 animated:YES];
}

-(void)btnSetNamaClk:(id)sender{
    ChildViewController *c2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ChildViewController"];
    id<ChildViewControllerDelegate> strongDelegate = c2.delegate;
    if([strongDelegate respondsToSelector:@selector(childViewController:didChooseValue:)]){
        
        [strongDelegate childViewController:c2 didChooseValue:@"Nama : iOS"];
        
    }
    
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
