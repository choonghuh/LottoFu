//
//  ViewController.m
//  LottoFu
//
//  Created by Wayne Cochran on 1/24/15.
//  Copyright (c) 2015 WSUV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *maxValueSegmentedControl;

//returns IBAction aka void
- (IBAction)buttonTouched:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.maxValueSegmentedControl.s
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Implementation: What to do when button touched
- (IBAction)buttonTouched:(UIButton *)sender {
    NSLog(@"buttonTouched: tag=%ld", sender.tag); //NSint is ld
}
@end
