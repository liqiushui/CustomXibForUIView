//
//  XibElementContainer.swift
//  TestLoadXib
//
//  Created by lunli on 2018/10/12.
//  Copyright © 2018年 lunli. All rights reserved.
//

import UIKit

@IBDesignable
class XibElementContainer: UIView {

    var elementView:UIView?
    @IBInspectable var elementNibName:String?

    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        elementView = view
    }
    
    func loadViewFromNib() -> UIView? {

        guard let nibName = elementNibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        elementView?.prepareForInterfaceBuilder()
    }
}
