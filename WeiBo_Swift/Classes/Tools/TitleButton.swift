//
//  TitleButton.swift
//  WeiBo_Swift
//
//  Created by 刘四芳 on 2017/11/11.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    //通过纯代码创建时调用
    //在swift中如果重写父类方法,必须在父类方法前面加上override
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI();
    }
    //t通过xib或者storybord创建时调用
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder);
        setupUI();
    }
    private func setupUI(){
        setImage(UIImage(named:"navigationbar_arrow_down"), for: UIControlState.normal);
        setImage(UIImage(named:"navigationbar_arrow_up"), for: UIControlState.selected)
        setTitleColor(UIColor.black, for: UIControlState.normal);
        sizeToFit();
    }
    override func setTitle(_ title: String?, for state: UIControlState) {
        // ?? 用于判断前面的参数是否是nil,如果是nil,就返回?? 后面的参数,如果不是nil,??后面的语句不执行
        super.setTitle((title ?? "") + "  ", for: state)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        //和OC不太一样,swift语法允许我们直接修改一个结构体属性的成员
        titleLabel?.frame.origin.x = 0;
        imageView?.frame.origin.x = titleLabel!.frame.width;
    }
}
