//
//  AppDelegate.swift
//  FootBall
//
//  Created by 张宏台 on 15/12/20.
//  Copyright © 2015年 张宏台. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.setTabBar()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    private func setTabBar(){
        let tabController:UITabBarController = self.window?.rootViewController as! UITabBarController
        let tabBar:UITabBar = tabController.tabBar
        
        let tabBarItem1:UITabBarItem = tabBar.items![0];
        let tabImg1:UIImage = UIImage(named: "1")!
        let tabImg:UIImage = UIImage(CGImage: tabImg1.CGImage!, scale: 2, orientation: .Up)
        let tabImgSelect1:UIImage = UIImage(named: "1_1")!
        let tabImgSelect:UIImage = UIImage(CGImage: tabImgSelect1.CGImage!, scale: 2, orientation: .Up)
        tabBarItem1.title = "足球天下"
        tabBarItem1.image = tabImg.imageWithRenderingMode(.AlwaysOriginal);
        tabBarItem1.selectedImage = tabImgSelect.imageWithRenderingMode(.AlwaysOriginal);

        let tabBarItem2:UITabBarItem = tabBar.items![1];
        let tabImgHis1:UIImage = UIImage(named: "2.png")!
        let tabImgHis:UIImage = UIImage(CGImage: tabImgHis1.CGImage!, scale: 2, orientation: .Up)
        let tabImgSelectHis1:UIImage = UIImage(named: "2_2.png")!
        let tabImgSelectHis:UIImage = UIImage(CGImage: tabImgSelectHis1.CGImage!, scale: 2, orientation: .Up)
        tabBarItem2.title = "我的活动"
        tabBarItem2.image = tabImgHis.imageWithRenderingMode(.AlwaysOriginal);
        tabBarItem2.selectedImage = tabImgSelectHis.imageWithRenderingMode(.AlwaysOriginal);

        let tabBarItem3:UITabBarItem = tabBar.items![2];
        let tabImgInfo1:UIImage = UIImage(named: "3")!
        let tabImgInfo:UIImage = UIImage(CGImage: tabImgInfo1.CGImage!, scale: 2, orientation: .Up)
        let tabImgSelectInfo1:UIImage = UIImage(named: "3_3")!
        let tabImgSelectInfo:UIImage = UIImage(CGImage: tabImgSelectInfo1.CGImage!, scale: 2, orientation: .Up)
        tabBarItem3.title = "我的信息"
        tabBarItem3.image = tabImgInfo.imageWithRenderingMode(.AlwaysOriginal);
        tabBarItem3.selectedImage = tabImgSelectInfo.imageWithRenderingMode(.AlwaysOriginal);
        
    }

}

