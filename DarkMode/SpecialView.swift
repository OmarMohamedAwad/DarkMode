//
//  SpecialView.swift
//  DarkMode
//
//  Created by Omar Awad on 1/6/20.
//  Copyright © 2020 Omar Awad. All rights reserved.
//
import UIKit
import Foundation

class SpecialView: UIView {

    override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup(){
        self.layer.cornerRadius = 15.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
      }

}

class SpecialCartView: UIView {

    override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup(){
        self.layer.cornerRadius = 20.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
      }

}

class SpecialImage: UIImageView {

    override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup(){
        roundCorners(corners: [.topLeft, .topRight], radius: 15.0)
      }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

}

class SpecialRoutImage: UIImageView {

    override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup(){
        
        roundCorners(corners: [.topLeft, .topRight, .bottomRight, .bottomRight], radius: 20.0)
      }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

}

class SpecialRoutButton: UIButton {

    override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup(){
       self.layer.cornerRadius = 20.0
       self.layer.shadowColor = UIColor.black.cgColor
       self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
       self.layer.shadowRadius = 2.0
       self.layer.shadowOpacity = 0.5
       self.layer.masksToBounds = false
      }

}


class SpecialRotateView: UIView {

    override init(frame: CGRect) {
      super.init(frame: frame)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    func setup(){
        rotate(angle: 50.0)
      }
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
    

}
