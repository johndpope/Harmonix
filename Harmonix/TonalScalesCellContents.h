//
//  TonalScalesCellContents.h
//  Harmonix
//
//  Created by Even Northug on 07.12.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TonalScalesCellContents : UIView
{
    UILabel *lblNum;
    UILabel *lblName;
    UILabel *lblShortName;
    UILabel *lblGender;     // could also be automatically assigned
    NSMutableArray *lblDegreeFamily;
}
@property (nonatomic, strong) UILabel *lblNum;
@property (nonatomic, strong) UILabel *lblName;
@property (nonatomic, strong) UILabel *lblShortName;
@property (nonatomic, strong) UILabel *lblGender;
@property (nonatomic, strong) NSMutableArray *lblDegreeFamily;

@end
