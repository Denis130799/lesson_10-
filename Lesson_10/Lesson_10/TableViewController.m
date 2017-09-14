//
//  TableViewController.m
//  Lesson_10
//
//  Created by Denis on 08.09.17.
//  Copyright © 2017 Denis. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "Coffee.h"

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *arrayOfCoffee;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *coffeeNamesArray = @[@"Late", @"Cappuccino", @"Espresso", @"Americano", @"CaramelMacchiato", @"CoffeeGlace", @"CoffeeMocha"];
    
    self.arrayOfCoffee = [NSMutableArray new];
    
    for (NSInteger i = 0; i < coffeeNamesArray.count; i++)
    {
        NSString *coffeeName = [coffeeNamesArray objectAtIndex:i];
        Coffee *coffee = [Coffee coffeeWithName:coffeeName];
        [self.arrayOfCoffee addObject:coffee];
    }
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.arrayOfCoffee.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Coffee *coffee = self.arrayOfCoffee[indexPath.row];
    cell.textLabel.text = coffee.nameCoffee;
    
    return cell;
    
    
}



//// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    if (indexPath.row ==2)
    {
        return NO;
    }
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.arrayOfCoffee removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *firstText = [self.arrayOfCoffee objectAtIndex:fromIndexPath.row];
    NSString *secondText = [self.arrayOfCoffee objectAtIndex:toIndexPath.row];
    
    [self.arrayOfCoffee replaceObjectAtIndex:toIndexPath.row withObject:firstText];
    [self.arrayOfCoffee replaceObjectAtIndex:fromIndexPath.row withObject:secondText];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    
    if (indexPath.row ==5)
    {
        return NO;
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *selectedCellString = self.arrayOfCoffee[indexPath.row];
//    NSLog(@"Was selected: %@", selectedCellString);
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)cell
{
    NSIndexPath *selectedCellIndexPath = [self.tableView indexPathForCell:cell];
    Coffee *coffee = [self.arrayOfCoffee objectAtIndex:selectedCellIndexPath.row];
    
    ViewController *vc = [segue destinationViewController];
    vc.coffee = coffee;
}


@end
