//
//  AppDelegate.swift
//  WeiBo_Swift
//
//  Created by jr on 2017/6/26.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        /*
        // Override point for customization after application launch.
        //1. 创建 window
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        //2. 设置根控制器
        window?.rootViewController = MainViewController()
        //3. 显示 window
        window?.makeKeyAndVisible()
        */
        //一般情况下设置全局性的属性,最好放在AppDelegate中设置,这样可以保证后续所有的操作都是设置之后的操作
        UINavigationBar.appearance().tintColor = UIColor.orange;
        return true
    }

  

}
//自定义 log (debug 显示, release不显示)
/*
 泛型
 func 函数名称<>(形参列表) -> 返回值类型
 T是什么类型由调用者决定
 */
/*
    debug 宏定义设置
   build setting -> 搜索  custom flag -> other swift flags -> debug 添加-D DEBUG
 */
func SLog<T>(message:T,
          fileName:String = #file,
          methodName:String=#function,
          lineNumber:Int = #line){
    #if DEBUG
        print("\(String(describing: (fileName as NSString).pathComponents.last)).\(methodName).\(lineNumber):\(message)")
    #endif
}
