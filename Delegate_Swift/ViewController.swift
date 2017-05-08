//
//  ViewController.swift
//  Delegate_Swift
//
//  Created by Tech-zhangyangyang on 2017/5/8.
//  Copyright © 2017年 Tech-zhangyangyang. All rights reserved.
//

import UIKit

@objc protocol HeaderDelegate {
    func buttonClick(str: String)
}

class CustomView: UIView {
   weak var delegate:HeaderDelegate?
   private var submitBtn: UIButton?
    
   override init(frame: CGRect) {
     super.init(frame: frame)
     submitBtn = UIButton(type: .custom)
     submitBtn?.frame = CGRect.init(x: 10, y: 30, width: 100, height: 50)
     submitBtn?.backgroundColor = UIColor.red
     submitBtn?.setTitle("代理传值", for: .normal)
     submitBtn?.addTarget(self, action: #selector(clickAction(_ :)), for: .touchUpInside)
     self.addSubview(submitBtn!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clickAction(_ : UIButton)  {
       self.delegate?.buttonClick(str:"ffff")
    }
}

class ViewController: UIViewController,HeaderDelegate {
    
    var customView: CustomView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView = CustomView.init(frame: CGRect.init(x: 0, y: 0, width:self.view.frame.size.width , height: 200))
        self.customView?.backgroundColor = UIColor.green
        self.customView?.delegate = self
        self.view.addSubview(self.customView!)
    }

    internal func buttonClick(str: String) {
        print(str)
    }
}

