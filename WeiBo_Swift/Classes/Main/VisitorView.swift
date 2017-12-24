//
//  VisitorView.swift
//  WeiBo_Swift
//
//  Created by 刘四芳 on 2017/10/19.
//  Copyright © 2017年 jr. All rights reserved.
//

import UIKit

protocol VisitorViewDelegate:NSObjectProtocol {
    //默认情况下,代理的方法必须实现
    func visitorViewDidClickLoginBtn(visitor:VisitorView) ;
    func visitorViewDidClickRegisterBtn(visitor:VisitorView) ;
}

class VisitorView: UIView {
    
    //登录
    @IBOutlet weak var loginButton: UIButton!
    //注册
    @IBOutlet weak var registerButton: UIButton!
    //转盘
    @IBOutlet weak var rotationImageView: UIImageView!
    //图标
    @IBOutlet weak var iconImageView: UIImageView!
    //文本
    @IBOutlet weak var titleLabel: UILabel!
    //和OC一样,代理用weak修饰
    weak var delegate:VisitorViewDelegate?
    
    //MARK:-外部控制的方法
    //快速创建方法
    class func visitoverView() -> VisitorView {
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)!.last as! VisitorView;
    }
   
    //设置访客视图上的数据
    //imageName需要显示的图标
    //titile需要显示的标题
    func setupVisitorInfo(imageName:String? ,title:String) {
        //设置标题
        titleLabel.text = title;
        //判断是否是首页,首页有默认图片
        guard imageName != nil else {
            startAniamation();
            return ;
        }
        
        //不是首页
        rotationImageView.isHidden = true;
        iconImageView.image = UIImage(named:imageName!);
    }
     //MARK:-内部控制的方法
    private func startAniamation() {
        //1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        //2.设置动画属性
        anim.toValue = 2*M_PI;
        anim.duration = 6.0;
        anim.repeatCount = MAXFLOAT;
        //注意:默认情况下只要视图消失,系统会自动移除动画,
        //只要设置isRemovedOnCompletion 为false,系统就不会移除动画
        anim.isRemovedOnCompletion = false;
        //3.将动画添加到图层上
        rotationImageView.layer.add(anim,forKey: nil);
    }
    /*
    //注册
    @IBAction func registerBtnClick(_ sender: Any) {
        //和OC不一样,swift中如果简单的调用代理方法,不用判断代理能否响应,因为代理方法默认必须实现
        delegate?.visitorViewDidClickRegisterBtn(visitor: self);
       
    }
    //登录

    @IBAction func loginBtnClick(_ sender: Any) {
        delegate?.visitorViewDidClickLoginBtn(visitor: self);
        
        
    }
 */
    
}
