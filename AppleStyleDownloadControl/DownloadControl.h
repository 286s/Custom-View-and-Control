//
//  DownloadControl.h
//  DownloadControl
//
//  Created by Antonio081014 on 4/29/15.
//  Copyright (c) 2015 antonio081014.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadControl : UIView

@property (nonatomic, getter=isLoading) BOOL loading;
@property (nonatomic, getter=isDownloading) BOOL downloading;
// Downloading Progress range from 0 to 100 in percent.
@property (nonatomic) NSUInteger downloadingProgress;
@property (nonatomic, strong) UIColor *appearenceColor;

@end
