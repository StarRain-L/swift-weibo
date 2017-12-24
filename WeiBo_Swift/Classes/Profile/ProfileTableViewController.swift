//
//  ProfileTableViewController.swift
//  WeiBo_Swift
//
//  Created by jr on 2017/6/26.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

class ProfileTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //判断用户是否登录
        if !isLogin {
            //设置访客视图
            visitorView?.setupVisitorInfo(imageName: "visitordiscover_image_profile", title: "登录后,你的微博,相册,个人资料会显示在这里,展示给别人")
        }
  
    }
}
