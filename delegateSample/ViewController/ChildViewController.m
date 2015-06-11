//
//  ChildViewController.m
//  delegateSample
//
//  Created by Rifat Firdaus on 6/11/15.
//  Copyright (c) 2015 Rifat Firdaus. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()
@property (weak, nonatomic) IBOutlet UIButton *submit;
@property (weak, nonatomic) IBOutlet UITextField *tfNilai;
-(IBAction)btnSubmitClk:(id)sender;
@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.storyboard l];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnSubmitClk:(id)sender{
    
    //XCODE bakalan komplen kalo kita akses property weak-
    //lebih dari satu kali di sini, makanya kita buat property strong-
    //buat nge-handle nya
    id<ChildViewControllerDelegate> strongDelegate = self.delegate;
    
    if([strongDelegate respondsToSelector:@selector(childViewController:didChooseValue:)]){
        
        [strongDelegate childViewController:self didChooseValue:_tfNilai.text];
        
    }
}

-(void)childViewController:(ChildViewController *)viewController didChooseValue:(NSString *)value{
    _tfNilai.text = value;
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
