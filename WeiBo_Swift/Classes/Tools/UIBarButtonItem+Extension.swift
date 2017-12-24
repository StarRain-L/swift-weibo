//
//  UIBarButtonItem+Extension.swift
//  WeiBo_Swift
//
//  Created by 刘四芳 on 2017/11/11.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    //便利构造函数
    //1.用于快速创建一个对象
    //2.依赖于指定构造方法
    convenience init(imageName:String,target: Any?, action: Selector) {
        let btn = UIButton();
        btn.setImage(UIImage(named:imageName), for: UIControlState.normal);
        btn.setImage(UIImage(named:imageName+"_highlighted"), for: UIControlState.highlighted);
        btn.sizeToFit();
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside);
        //依赖系统提供的int方法
        self.init(customView:btn);
    }
}
