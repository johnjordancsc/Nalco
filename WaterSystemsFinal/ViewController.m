//
//  ViewController.m
//  WaterSystemsFinal
//
//  Created by James on 12/18/14.
//  Copyright (c) 2014 NCITSolutions. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
NSInteger indicator;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View loaded");
    // Do any additional setup after loading the view, typically from a nib.
    
    for (UITextField * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]]) {
            txt.KeyboardType = UIKeyboardTypeNumbersAndPunctuation;
        }
    }
        
    UIButton *MenuBtn = [[UIButton alloc] initWithFrame: CGRectMake(320, 11, 50, 55)];
    //MenuBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:MenuBtn];
    [MenuBtn addTarget:self action:@selector(menuButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    NSLog(@"TOUCH");
    [self.view endEditing:YES];// this will do the trick
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
            NSLog(@"IF-TOUCH");
            [txt resignFirstResponder];
        }
    }
}


- (IBAction)menuButtonClicked:(UIButton*)sender
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: CGRectMake(2, 60,371,270)];
    if (indicator == 0) {
        indicator = 1;
        NSLog(@"Show Menu");
    //UIImageView *imageView = [[UIImageView alloc] initWithFrame: CGRectMake(2, 60,371,270)];
    imageView.image = [UIImage imageNamed:@"Home-Dropdown-Menu.png"];
        imageView.tag = 2;
    [self.view addSubview:imageView];
    }
    else {
        indicator = 0;
        NSLog(@"Hide Menu");
        for (UIView *subview in [self.view subviews]) {
            // Only remove the subviews with tag not equal to 1
            if (subview.tag == 2) {
                [subview removeFromSuperview];
            }
        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
