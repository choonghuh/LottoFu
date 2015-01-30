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
@property (weak, nonatomic) IBOutlet UIView *buttonView;

//

//returns IBAction aka void
- (IBAction)buttonTouched:(UIButton *)sender;
- (IBAction)maxValueSelected:(UISegmentedControl *)sender;
- (IBAction)pickAll:(id)sender; // could have different sender, so leave (id)

@end

@implementation ViewController

- (void)setNumberButtons
{
    for (NSInteger i = 0; i<6 ; i++)
    {
        //find buttons by their tags
        UIButton *button = (UIButton*)[self.buttonView viewWithTag:i+1];
        const NSInteger num = [self.luckyNumbers number:i];
        [button setTitle:[NSString stringWithFormat:@"%ld", num]
                forState:UIControlStateNormal]; // build a string based on var num
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // At this point, all objects are loaded
    // Safe place for initializations
    
    self.maxValueSegmentedControl.selectedSegmentIndex = 1;
    self.luckyNumbers = [[LuckyNumber alloc] initWithMax:48];
    [self setNumberButtons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Implementation: What to do when button touched
- (IBAction)buttonTouched:(UIButton *)sender {
    NSLog(@"buttonTouched: tag=%ld", sender.tag); //NSint is ld
    [self.luckyNumbers pickNumber:sender.tag-1];
    const NSInteger num = [self.luckyNumbers number:sender.tag-1];
    [sender setTitle: [NSString stringWithFormat:@"%ld", num]
            forState:UIControlStateNormal];
}

- (IBAction)maxValueSelected:(UISegmentedControl *)sender {     // for Segmentedcontrol button
    NSLog(@"maxValueSelected: %ld", sender.selectedSegmentIndex);
    self.luckyNumbers.maxNumber = (sender.selectedSegmentIndex == 0) ? 48:56; // calls setMaxNumber method
    [self setNumberButtons];
}

- (IBAction)pickAll:(id)sender {
    NSLog(@"pickAll");
    [self.luckyNumbers pickAllNumbers]; // get new numbers
    [self setNumberButtons];    // refresh the buttons
}
@end
