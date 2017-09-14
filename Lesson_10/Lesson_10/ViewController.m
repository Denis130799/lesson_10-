//
//  ViewController.m
//  Lesson_10
//
//  Created by Denis on 08.09.17.
//  Copyright © 2017 Denis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet UITextView *coffeeTextView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.coffee)
    {
        self.navigationItem.title = self.coffee.nameCoffee;
        self.coffeeTextView.text = self.coffee.descriptionCoffee;
        
        if (self.coffee.coffeeImage)
        {
            self.coffeeImageView.image = self.coffee.coffeeImage;
        }
    }
    
    }




@end
