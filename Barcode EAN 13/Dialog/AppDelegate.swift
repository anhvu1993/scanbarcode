//
//  AppDelegate.swift
//  Barcode EAN 13
//
//  Created by Bui Van Tuan on 7/17/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let action = Notification.Name("action")
    static let showAlert = Notification.Name("showAlert")
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        let alert = UIAlertController(title: "タイトル", message: "本画面は、精算前にスキャンしてくださスキャンい場合はインターネットボタンを押し番号を手入力してください", preferredStyle: .alert)
        alert.view.layer.borderColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9124839469)
        alert.view.layer.cornerRadius = 5
        alert.view.layer.borderWidth  = 5
        alert.view.layer.opacity      = 0.5
            alert.addAction(UIAlertAction(title: "次 の", style: .default, handler: { (data) in
            NotificationCenter.default.post(name: .action, object: nil, userInfo: nil)
        }))
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
}

