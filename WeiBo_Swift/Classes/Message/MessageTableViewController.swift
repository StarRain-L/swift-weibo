//
//  MessageTableViewController.swift
//  WeiBo_Swift
//
//  Created by jr on 2017/6/26.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

class MessageTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //判断用户是否登录
        if !isLogin {
            //设置访客视图
            visitorView?.setupVisitorInfo(imageName: "visitordiscover_image_message", title: "登录后,别人评论你的微博,发给你的消息,都会在这里收到通知")
        }

    }
}
