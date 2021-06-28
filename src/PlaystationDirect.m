#import "../include/PlaystationDirect.h"

#define DISC_API_URL    [NSURL URLWithString:@"https://api.direct.playstation.com/commercewebservices/ps-direct-us/products/productList?fields=BASIC&productCodes=3005816"]
#define DIGITAL_API_URL [NSURL URLWithString:@"https://api.direct.playstation.com/commercewebservices/ps-direct-us/products/productList?fields=BASIC&productCodes=3005817"]

@implementation PlaystationDirect

+ (BOOL)checkStock:(NSString*)console {

    NSData* jsonData;

    if ([console isEqualToString:@"disc"]) { jsonData = [NSData dataWithContentsOfURL:DISC_API_URL]; }
    else if ([console isEqualToString:@"digital"]) { jsonData = [NSData dataWithContentsOfURL:DIGITAL_API_URL]; }
    else { NSLog(@"wtf????"); return NO; }

    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers | NSJSONReadingAllowFragments error:nil];

    NSArray *products = [json objectForKey:@"products"];
    for (NSDictionary *product in products) {
        NSString *stockLevelStatus = [[product objectForKey:@"stock"] objectForKey:@"stockLevelStatus"];
        if (![stockLevelStatus isEqualToString:@"outOfStock"]) {
            NSLog(@"in stock!");
            return YES;
        }
    }

    NSLog(@"oos");
    return NO;

}

@end