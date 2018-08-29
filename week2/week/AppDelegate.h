//
//  AppDelegate.h
//  week
//
//  Created by 郭涛玮 on 2018/8/26.
//  Copyright © 2018年 郭涛玮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

