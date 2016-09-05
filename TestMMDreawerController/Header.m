//
//  Header.m
//  TestMMDreawerController
//
//  Created by Danny Ho on 9/5/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "Header.h"

@implementation Header

+ (instancetype)headerLoad {
    return [[[NSBundle mainBundle] loadNibNamed:@"Header" owner:nil options:nil] lastObject];
}

@end
