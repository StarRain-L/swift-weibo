//
//  wbUIPresentationController.swift
//  WeiBo_Swift
//
//  Created by 刘四芳 on 2017/12/24.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

class wbUIPresentationController: UIPresentationController {
    /*
     1.如果不自定义转场modal出来的控制器会移除原有的控制器
     2.如果自定义转场modal出来的控制器不会移除原有的控制器
     3.如果不自定义转场modal出来的控制器的尺寸和屏幕一样
     4.如果自定义转场modal出来的控制器的尺寸我们可以自己在containerViewWillLayoutSubviews方法中控制
     5.containerView 非常重要, 容器视图, 所有modal出来的视图都是添加到containerView上的
     6.presentedView() 非常重要, 通过该方法能够拿到弹出的视图
     */
    /**
     重写初始化方法,用于创建负责转场的动画
     - parameter presentedViewController:  被展现的控制器
     - parameter presentingViewController: 发起的控制器
     */
    override init(presentedViewController: UIViewController, presenting: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presenting)
    }
    // 用于布局转场动画弹出的控件
    /**
     重写containerViewWillLayoutSubviews,在即将布局转场子视图时调用
     */
    override func containerViewWillLayoutSubviews() {
        
        //修改弹出视图的大小
        //presentedView: 被展现的视图
        //containerView: 容器视图
        // 设置弹出视图的尺寸
        presentedView?.frame = CGRect(x: 100, y: 45, width: 200, height: 200)
    }
}
