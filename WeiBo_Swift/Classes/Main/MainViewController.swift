//
//  MainViewController.swift
//  WeiBo_Swift
//
//  Created by jr on 2017/6/26.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    //MARK: -生命周期方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //1.添加加号按钮
        tabBar.addSubview(composeButton)
        //2.设置加号按钮的位置
        //保存按钮的尺寸
        let rect = composeButton.frame;
        //计算宽度
        let width = tabBar.bounds.width/CGFloat(childViewControllers.count)
        //设置按钮位置
        composeButton.frame = CGRect(x:2*width,y:0,width:width,height:rect.height)
//        composeButton.frame = rect.offsetBy(dx: 2*width, dy: 0);
        
    }
/*
 storyboard去除
    //MARK: -内部控制方法
    //添加所有的子控制器
    func addChildViewControllers() {
        //1.根据 json 文件创建控制器
        //1.1读取 json 数据
        guard let filePath = Bundle.main.path(forResource: "MainVCSetting.json", ofType: nil) else {
            SLog(message: "json文件不存在")
            return
        }
        guard let data = NSData.init(contentsOfFile: filePath) else {
            SLog(message: "加载二进制失败")
            return
        }
//            SLog(message: data)
        do {
            //1.2将json 数据转换为对象(数组字典),首先二进制转换对象不知道是什么对象,所以是 anyobject,所以后面必须指定数组字典
            let objc = try JSONSerialization.jsonObject(with:data as Data, options:JSONSerialization.ReadingOptions.mutableContainers) as! [[String:AnyObject]]
//            SLog(message: objc)
            for dict in objc {
                let vcName = dict["vcName"] as? String
                let title = dict["title"] as? String
                let imageName = dict["imageName"] as? String
                addChildViewController(childControllerName: vcName, title: title, imageName: imageName)
                
            }
        } catch  {
            print("读取本地数据出现错误！")
            addChildViewController(childControllerName: "HomeTableViewController", title: "首页", imageName: "tabbar_home")
            addChildViewController(childControllerName: "MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
            addChildViewController(childControllerName: "NullViewController", title: "", imageName: "")
            addChildViewController(childControllerName: "DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
            addChildViewController(childControllerName: "ProfileTableViewController", title: "个人", imageName: "tabbar_profile")
        }
    }
    //添加一个子控制器
    func addChildViewController(childControllerName: String?,title:String?,imageName:String?) {
        //1.动态获取命名空间
        /*
           由于字典/数组只能存储对象,所以通过key从字典取出的值是一个AnyObject类型,如果key值写错或者没有对应的值,那么就取不到值,所以返回值可能有值也可能没值,所以最终的类型是AnyObject?
         */

        guard let name =
            Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            return
        }
        //2 根据字符串获取 class
        var cls:AnyClass? = nil
        if let vcName = childControllerName {
            cls = NSClassFromString(name+"."+vcName)
        }
        //根据 class 创建对象
        //swift中如果想通过一个 class 来创建一个对象,必须告诉这个 class 的确切类型
        guard let clsType = cls as? UITableViewController.Type else {
            return
        }
        //1.2设置自控制的相关属性
        let childController = clsType.init()
        childController.title = title
        
        if let imageN = imageName {
            childController.tabBarItem.image = UIImage.init(named: imageN)
            childController.tabBarItem.selectedImage = UIImage(named:imageN + "_highlighter")
        }
       
        //1.3包装一个导航条
        let nav = UINavigationController.init(rootViewController: childController)
        //1.4将自控制器添加到UITabBarController
        addChildViewController(nav)

        
    }
 */
    func compseBtnClick(btn:UIButton) {
        SLog(message: "点击加号");
//        SLog(message: btn);
    }
    //MARK: -懒加载
   private lazy var composeButton:UIButton = {
        () -> UIButton
        in
        //1.创建按钮
        let btn = UIButton(imageName:"tabbar_compose_icon_add",background:"tabbar_compose_button")
//        //2.设置前景图片
//        btn.setImage(UIImage.init(named:"tabbar_compose_icon_add"), for: UIControlState.normal)
//        btn.setImage(UIImage.init(named:"tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
//        //3.设置背景图片
//        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControlState.normal)
//        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
//        //4.调整尺寸
//        btn.sizeToFit();
        //5.监听按钮点击
        btn.addTarget(self, action: #selector(compseBtnClick), for: UIControlEvents.touchUpInside);
        
        return btn
    }()
}
