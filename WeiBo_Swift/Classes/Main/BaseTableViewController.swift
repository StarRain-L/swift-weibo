//
//  BaseTableViewController.swift
//  WeiBo_Swift
//
//  Created by 刘四芳 on 2017/10/19.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit
/*
 通知:层级结构较深
 代理:父子,方法较多时使用
 block:父子,方法较少时使用(一般情况一个方法)
 */
class BaseTableViewController: UITableViewController {
    
    //标记记录用户登录状态
    var isLogin = true;
    //访客试图
    var visitorView:VisitorView?;
    
    override func loadView() {
        //判断用户是否登录,如果没有登录就显示访客界面,如果已经登录就显示tableview
        isLogin ? super.loadView() : setupVisitorView();
    }
    
    private func setupVisitorView() {
        //1.创建访客
        visitorView = VisitorView.visitoverView();
        view = visitorView;
        //2.设置代理

        visitorView?.loginButton.addTarget(self, action: #selector(loginBtnCLick), for: UIControlEvents.touchUpInside);
        visitorView?.registerButton.addTarget(self, action: #selector(registerBtnClick), for: UIControlEvents.touchUpInside);
       
      
    }
    //MARK:- 内部控制方法
    //监听登录/注册按钮点击
    @objc private func loginBtnCLick(btn:UIButton){
        SLog(message: "登录")
    }
    @objc private func registerBtnClick(btn:UIButton){
        SLog(message: "注册")
    }
}

