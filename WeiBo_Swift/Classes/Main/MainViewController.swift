//
//  MainViewController.swift
//  WeiBo_Swift
//
//  Created by jr on 2017/6/26.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1.添加自控制器
        /*
        //1.1创建自控制器
        let vc = HomeTableViewController()
        //1.2设置子控制器的相关属性
        vc.tabBarItem.title = "首页"
        vc.tabBarItem.image = UIImage.init(named: "")
        vc.tabBarItem.selectedImage = UIImage(named:"")
        tabBar.tintColor = UIColor.orange
        //1.3将自控制器添加到UITabBarController
        addChildViewController(vc)
         */
        //iOS7之后只需要设置tintColor
        tabBar.tintColor = UIColor.orange
        //添加子控制器
        addChildViewControllers()
        //添加加号按钮
        tabBar.addSubview(composeButton)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //保存按钮的尺寸
        let rect = composeButton.frame.size
        //计算宽度
        let width = tabBar.bounds.width/CGFloat(childViewControllers.count)
        //设置按钮位置
        composeButton.frame = CGRect(x:2*width,y:0,width:width,height:rect.height)
        
        
    }
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
            SLog(message: data)
        do {
            //1.2将json 数据转换为对象(数组字典),首先二进制转换对象不知道是什么对象,所以是 anyobject,所以后面必须指定数组字典
            let objc = try JSONSerialization.jsonObject(with:data as Data, options:JSONSerialization.ReadingOptions.mutableContainers) as! [[String:AnyObject]]
            SLog(message: objc)
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
    //MARK: -懒加载
    lazy var composeButton:UIButton = {
        () -> UIButton
        in
        //1.创建按钮
        let btn = UIButton()
        //2.设置前景图片
        btn.setImage(UIImage.init(named:"tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage.init(named:"tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        //3.设置背景图片
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        return btn
    }()
}
