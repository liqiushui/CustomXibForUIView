//
//  XibBaseView.swift
//  LALiveRankChart
//
//  Created by lunli on 2018/10/10.
//  Copyright © 2018年 lunli. All rights reserved.
//

import UIKit

class XibBaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nibInitKey = "commonInitNib" + nibName
        let dic = Thread.current.threadDictionary
        
        guard (dic.value(forKey: nibInitKey) != nil) else {
            //防止 loadNibNamed 触发 required init?(coder aDecoder: NSCoder) 方法导致递归调用
            dic.setValue(true, forKey: nibInitKey)
            defer {
                dic.removeObject(forKey: nibInitKey)
            }
            //加载 nib资源
            let vArr = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
            if let content = vArr?.first as? UIView {
                content.fixInView(self)
                customInit()
            }
            return
        }
    }
    
    public func customInit(){
        #if DEBUG
            fatalError("Method customInit Called Once, must be overrided")
        #endif
    }
}

extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
