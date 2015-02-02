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

//returns IBAction aka void
- (IBAction)buttonTouched:(UIButton *)sender;
- (IBAction)maxValueSelected:(UISegmentedControl *)sender;
- (IBAction)pickAll:(id)sender; // could have different sender, so leave (id)

@end

@implementation ViewController

-(NSString*)sandboxFileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = paths[0]; //pathname for my documents
    NSString*filename = [docDir stringByAppendingPathComponent:@"luckynumbers.plist"]; //property list
    return filename;
}


#define kMaxValueKey @"maxValue"
#define kLuckyNumbersKey @"luckyNumbersKey"
// When does the app resign?
// Write the data
-(void)appWillResignActive:(NSNotification*)notification
{
    NSLog(@"appWillResignActive");
    NSString *fileName = [self sandboxFileName];
    // Must save six numbers and the max -> use dict
    NSDictionary *dict = @{kMaxValueKey : @(self.luckyNumbers.maxNumber),
                           kLuckyNumbersKey : self.luckyNumbers.numbers};
    
    [dict writeToFile:fileName atomically:YES];
    
}

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
    
    NSString *fileName = [self sandboxFileName];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:fileName])
    {
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:fileName];
        self.luckyNumbers.maxNumber = [[dict objectForKey:kMaxValueKey] integerValue];
        NSArray *numbers = [dict objectForKey:kLuckyNumbersKey];
        //need a mutable copy of this array
        self.luckyNumbers.numbers = [numbers mutableCopy];
    }
    else
    {
        self.luckyNumbers = [[LuckyNumber alloc] initWithMax:48];
    }
    
    [self setNumberButtons];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    // Add self as observer, invoke appwillresignactive.
    // Controller will know when app is inactive (home button)
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
