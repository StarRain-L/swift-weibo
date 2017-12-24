//
//  UIButton+Extension.swift
//  WeiBo_Swift
//
//  Created by 刘四芳 on 2017/10/19.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

extension UIButton{
    convenience init(imageName:String,background:String) {
        self.init();
        //2.设置前景图片
        setImage(UIImage.init(named:"tabbar_compose_icon_add"), for: UIControlState.normal)
        setImage(UIImage.init(named:"tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        //3.设置背景图片
        setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControlState.normal)
        setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        //4.调整尺寸
        sizeToFit();
  
    }
}
