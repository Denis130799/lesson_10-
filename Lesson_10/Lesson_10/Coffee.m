//
//  Coffee.m
//  Lesson_10
//
//  Created by Denis on 12.09.17.
//  Copyright © 2017 Denis. All rights reserved.
//

#import "Coffee.h"

@implementation Coffee

+ (Coffee*)coffeeWithName:(NSString *)name
{
    NSString *coffeeNameLocalizedKey = [NSString stringWithFormat:@"%@.name", name];
    NSString *coffeeDesciptionTextLocalizedKey = [NSString stringWithFormat:@"%@.description", name];
    UIImage *coffeeImage = [UIImage imageNamed:name];

    Coffee *coffee = [Coffee new];
    coffee.nameCoffee = NSLocalizedString(coffeeNameLocalizedKey, nil);
    coffee.descriptionCoffee = NSLocalizedString(coffeeDesciptionTextLocalizedKey, nil);
    coffee.coffeeImage = coffeeImage;
    
    return coffee;
}

@end
