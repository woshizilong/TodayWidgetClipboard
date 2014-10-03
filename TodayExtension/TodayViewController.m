//
//  TodayViewController.m
//  TodayExtension
//
//  Created by Pol Quintana on 03/10/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "ViewController.h"

@interface TodayViewController () <NCWidgetProviding>
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *getSaved = [NSUserDefaults standardUserDefaults];
    self.textLabel.text = [getSaved objectForKey:@"text"];
}
- (IBAction)pasteTextFromClipboard:(UIButton *)sender {
    self.textLabel.text = [UIPasteboard generalPasteboard].string;
    NSUserDefaults *toSave = [NSUserDefaults standardUserDefaults];
    [toSave setObject:self.textLabel.text forKey:@"text"];
}
- (IBAction)copyTextToClipboard:(UIButton *)sender {
    [UIPasteboard generalPasteboard].string = self.textLabel.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}*/

-(UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsZero;
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
