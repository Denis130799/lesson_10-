//
//  Coffee.h
//  Lesson_10
//
//  Created by Denis on 12.09.17.
//  Copyright © 2017 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Coffee : NSObject

@property (nonatomic, strong)NSString *nameCoffee;
@property (nonatomic, strong)NSString *descriptionCoffee;
@property (nonatomic, strong)UIImage *coffeeImage;

+ (Coffee*)coffeeWithName:(NSString*)name;




@end
