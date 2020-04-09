//
//  nay.swift
//  TestAnimation
//
//  Created by Maher on 4/8/20.
//  Copyright © 2020 emad ios. All rights reserved.
//

import UIKit


class MStabBar : UITabBar {
    var tabWidth: CGFloat = 0
       var index: CGFloat = 0 {
           willSet{
               self.previousIndex = index
           }
       }
       private var animated = false
       private var selectedImage: UIImage?
       private var previousIndex: CGFloat = 0
       override init(frame: CGRect) {
           super.init(frame: frame)
       
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
     
           
       }
       override func draw(_ rect: CGRect) {
           let fillColor: UIColor = .white
           tabWidth = self.bounds.width / CGFloat(self.items!.count)
           let bezPath = drawPath(for: 2)
           
           bezPath.close()
           fillColor.setFill()
           bezPath.fill()
           let mask = CAShapeLayer()
           mask.fillRule = .evenOdd
           mask.fillColor = UIColor.white.cgColor
           mask.path = bezPath.cgPath
           if (self.animated) {
               let bezAnimation = CABasicAnimation(keyPath: "path")
               let bezPathFrom = drawPath(for: previousIndex)
               bezAnimation.toValue = bezPath.cgPath
               bezAnimation.fromValue = bezPathFrom.cgPath
               bezAnimation.duration = 0.3
               bezAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
               mask.add(bezAnimation, forKey: nil)
           }
           self.layer.mask = mask

       }
       
       func select(itemAt: Int, animated: Bool) {
           self.index = CGFloat(itemAt)
           self.animated = animated
           self.selectedImage = self.selectedItem?.selectedImage
           self.selectedItem?.selectedImage = nil
           self.setNeedsDisplay()
       }
       
    
       private func drawPath(for index: CGFloat) -> UIBezierPath {
           let bezPath = UIBezierPath()

           let firstPoint = CGPoint(x: (2 * tabWidth) - 25, y: 0)
        
        
           let firstPointFirstCurve = CGPoint(x: ((tabWidth * index) + tabWidth / 4) - 10, y: 0)
           let firstPointSecondCurve = CGPoint(x: ((index * tabWidth) - 20) + tabWidth / 8, y: 45)

           let middlePoint = CGPoint(x: (tabWidth * index) + tabWidth / 2, y: 47)
        
        
           let middlePointFirstCurve = CGPoint(x: (((tabWidth * index) + tabWidth) - tabWidth / 8) + 20, y: 45)
           let middlePointSecondCurve = CGPoint(x: (((tabWidth * index) + tabWidth) - tabWidth / 4) + 10 , y: 0)

           let lastPoint = CGPoint(x: (tabWidth * index) + tabWidth + 25, y: 0)
        
        
           bezPath.move(to: firstPoint)
           bezPath.addCurve(to: middlePoint, controlPoint1: firstPointFirstCurve, controlPoint2: firstPointSecondCurve)
           bezPath.addCurve(to: lastPoint, controlPoint1: middlePointFirstCurve, controlPoint2: middlePointSecondCurve)
           bezPath.append(UIBezierPath(rect: self.bounds))
           return bezPath
       }
       

}
