//
//  ViewController.m
//  LottoFu
//
//  Created by Wayne Cochran on 1/24/15.
//  Copyright (c) 2015 WSUV. All rights reserved.
//

#import "ViewController.h"
#import "LuckyNumber.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *maxValueSegmentedControl;

@property (strong, nonatomic) LuckyNumber *luckyNumbers;

//

//returns IBAction aka void
- (IBAction)buttonTouched:(UIButton *)sender;
- (IBAction)maxValueSelected:(UISegmentedControl *)sender;
- (IBAction)pickAll:(id)sender; // could have different sender, so leave (id)

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.maxValueSegmentedControl.selectedSegmentIndex = 1;
    self.luckyNumbers = [[LuckyNumber alloc] initWithMax:48];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Implementation: What to do when button touched
- (IBAction)buttonTouched:(UIButton *)sender {
    NSLog(@"buttonTouched: tag=%ld", sender.tag); //NSint is ld
}

- (IBAction)maxValueSelected:(UISegmentedControl *)sender {
    NSLog(@"maxValueSelected: %ld", sender.selectedSegmentIndex);
}

- (IBAction)pickAll:(id)sender {
    NSLog(@"pickAll");
}
@end
