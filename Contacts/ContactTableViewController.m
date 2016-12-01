//
//  ContactTableViewController.m
//  Contacts
//
//  Created by HSummy on 12/1/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

#import "ContactTableViewController.h"

@interface ContactTableViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation ContactTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

#pragma mark - Text Field Delegate
    
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    BOOL returnValue = NO;
    
    if (textField == self.nameTextField)
    {
        if (![self.nameTextField.text isEqualToString:@""])
        {
            NSArray *nameComponents = [self.nameTextField.text componentsSeparatedByString:@" "];
            if (nameComponents.count == 2)
            {
                NSString *firstName = nameComponents[0];
                NSString *lastName = nameComponents[1];
                
                NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
                if ([firstName rangeOfCharacterFromSet:set].location != NSNotFound)
                {
                NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
                if ([lastName rangeOfCharacterFromSet:set].location != NSNotFound)
            {
            returnValue = YES;
            [self.streetTextField becomeFirstResponder];
            }
        }
    }
    else if (textField == self.streetTextField)
    {
        if (![self.streetTextField.text isEqualToString:@""])
        {
            NSArray *streetComponents = [self.streetTextField.text componentsSeparatedByString:@" "];
            if (streetComponents.count == 3)
            {
                NSString *streetNumber = streetComponents[0];
                NSString *streetType = streetComponents[2];
                
                NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
                if ([streetNumber rangeOfCharacterFromSet:set].location != NSNotFound)
                {
                NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"];
                if ([streetType rangeOfCharacterFromSet:set].location != NSNotFound)
                    {
            returnValue = YES;
            [self.cityTextField becomeFirstResponder];
                    }
                }
            }
        }
            
    }
    else if (textField == self.cityTextField)
    {
        if (![self.cityTextField.text isEqualToString:@""])
        {
            returnValue = YES;
            [self.stateTextField becomeFirstResponder];
        }
    }
    else if (textField == self.stateTextField)
    {
        if ([self.stateTextField.text length] == 2)
        {
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
            if ([self.stateTextField.text rangeOfCharacterFromSet:set].location != NSNotFound)
            {
            returnValue = YES;
            [self.zipTextField becomeFirstResponder];
            }
        }
    }
    else if (textField == self.zipTextField)
    {
        if ([self.zipTextField.text length] == 5)
        {
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            if ([self.zipTextField.text rangeOfCharacterFromSet:set].location != NSNotFound)
            {
            returnValue = YES;
            [self.phoneTextField becomeFirstResponder];
            }
        }
    }
    else if (textField == self.phoneTextField)
    {
        if ([self.phoneTextField.text length] == 10)
        {
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            if ([self.phoneTextField.text rangeOfCharacterFromSet:set].location != NSNotFound)
            {
            returnValue = YES;
            [self.phoneTextField resignFirstResponder];
            }
        }
    }
    }
    }
    return returnValue;

}
    @end
