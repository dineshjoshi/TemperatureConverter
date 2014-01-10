//
//  TempConvViewController.m
//  TC
//
//  Created by Dinesh Joshi on 1/9/14.
//  Copyright (c) 2014 Dinesh Joshi. All rights reserved.
//

#import "TempConvViewController.h"

@interface TempConvViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTempTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSelector;
@property (weak, nonatomic) IBOutlet UILabel *convertedTempLabel;
- (IBAction)onTapEvent:(UITapGestureRecognizer *)sender;
- (float) celciusToFarhenheit:(float)inp;
- (float) farhenheitToCelcius:(float)inp;

@end

@implementation TempConvViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)onValueChanged:(id)sender {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateTemp];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapEvent:(UITapGestureRecognizer *)sender {
    [self.inputTempTextField endEditing:YES];
    [self updateTemp];
}

- (void) updateTemp {
    float inputTemp = [self.inputTempTextField.text floatValue];
    int inputTempUnit = self.unitSelector.selectedSegmentIndex;
    float retVal = 0;
    NSString *fmtString;
    
    if (inputTempUnit == 0) {
        // celcius to farenheit
        retVal = [self celciusToFarhenheit:inputTemp];
        fmtString = @"%0.2fC = %0.2fF";
    } else {
        retVal = [self farhenheitToCelcius:inputTemp];
        fmtString = @"%0.2fF = %0.2fC";
    }
    
    self.convertedTempLabel.text = [NSString stringWithFormat:fmtString, inputTemp, retVal];
}

- (float) celciusToFarhenheit:(float)inp {
    return ((inp * 1.8) + 32);
}

- (float) farhenheitToCelcius:(float)inp {
    return ((inp - 32) / 1.8);
}


@end
