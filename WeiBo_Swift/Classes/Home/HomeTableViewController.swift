//
//  HomeTableViewController.swift
//  WeiBo_Swift
//
//  Created by jr on 2017/6/26.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //判断用户是否登录
        if !isLogin {
            //设置访客视图
            visitorView?.setupVisitorInfo(imageName: nil, title: "关注一些人,回看这里有什么惊喜")
        }
        //2.添加导航条按钮
        /*
         navigationItem.leftBarButtonItem = UIBarButtonItem(title:"注册",style:UIBarButtonItemStyle.plain,target:self,action:#selector(registerBtnClick));
         navigationItem.rightBarButtonItem = UIBarButtonItem(title:"登录",style:UIBarButtonItemStyle.plain,target:self,action:#selector(loginBtnCLick));
         */
        //封装UIBarButtonItem方法
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName:"navigationbar_friendattention",target:self,action:#selector(leftBtnClick));
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName:"navigationbar_pop",target:self,action:#selector(rightBtnClick));
        //3.导航栏文字
        let titleButton = TitleButton();
        titleButton.setTitle("首页", for: UIControlState.normal);
        titleButton.addTarget(self, action: #selector(titleButtonClick), for: UIControlEvents.touchUpInside);
        navigationItem.titleView = titleButton;
        
    }
    //MARK:- 内部控制方法
    @objc private func leftBtnClick(btn:UIButton){
        SLog(message: "个人中心")
    }
    @objc private func rightBtnClick(btn:UIButton){
        SLog(message: "扫描")
    }
    @objc private func titleButtonClick(btn:UIButton){
        SLog(message: "title点击")
        //1.修改按钮的状态
        btn.isSelected = !btn.isSelected;
        //2.显示菜单
        //2.1创建菜单
        let sb = UIStoryboard(name:"Popover",bundle:nil);
        guard let menuView = sb.instantiateInitialViewController() else {
            return;
        }
        //自定义转场动画
        //设置转场代理
        menuView.transitioningDelegate = self
        // 设置转场动画样式
        menuView.modalPresentationStyle = UIModalPresentationStyle.custom
        
        //2.2弹出菜单
        present(menuView, animated: true, completion: nil);
    }

}

extension HomeTableViewController: UIViewControllerTransitioningDelegate
{
    
    // 该方法用于返回一个负责转场动画的对象
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        return wbUIPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
