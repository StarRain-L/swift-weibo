//
//  DiscoverTableViewController.swift
//  WeiBo_Swift
//
//  Created by jr on 2017/6/26.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

class DiscoverTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //判断用户是否登录
        if !isLogin {
            //设置访客视图
            visitorView?.setupVisitorInfo(imageName: nil, title: "关注一些人,回看这里有什么惊喜")
        }

    }

   
}
