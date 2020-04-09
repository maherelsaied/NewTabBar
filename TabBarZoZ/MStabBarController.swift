//
//  MytabBar.swift
//  TestAnimation
//
//  Created by Maher on 4/8/20.
//  Copyright © 2020 emad ios. All rights reserved.
//

import UIKit


class MStabBarController : UITabBarController , UITabBarControllerDelegate
{
    private var circleView : UIView!
    private var circleImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = MStabBar()
        self.setValue(tabBar, forKey: "tabBar")
        self.circleView = UIView(frame: .zero)
        circleView.layer.cornerRadius = 30
        circleView.backgroundColor = .white
        circleView.isUserInteractionEnabled = false
        self.circleImageView = UIImageView(frame: .zero)
        circleImageView.layer.cornerRadius = 30
        circleImageView.isUserInteractionEnabled = false
        circleImageView.contentMode = .center
        circleView.addSubview(circleImageView)
        self.view.addSubview(circleView)
        self.tabBar.tintColor = .red
        self.tabBar.barTintColor = .white
        self.tabBar.backgroundColor = .white
        self.delegate = self
    }
    
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        circleView.frame = CGRect(x: self.view.bounds.width / 2 - 30, y: self.tabBar.frame.origin.y - 20 , width: 60, height: 60)
        
         circleImageView.frame = self.circleView.bounds
         circleImageView.image = image(with: self.tabBar.items?[2].image, scaledTo: CGSize(width: 30, height: 30))
 

        
    }
    
    open override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.viewSafeAreaInsetsDidChange()
        }
        updateTabBarFrame()
    }
    
    
    private func updateTabBarFrame() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 60
        tabFrame.origin.y = self.view.frame.size.height - 60
        self.tabBar.frame = tabFrame
        tabBar.setNeedsLayout()
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
           if selectedIndex == 2 {
       //     circleImageView.image = image(with: UIImage(named: "ImageName"), scaledTo: CGSize(width: 30, height: 30))
           }else{
         //   circleImageView.image = image(with: self.tabBar.items?[2].image, scaledTo: CGSize(width: 30, height: 30))
            
        }
    }
    

    
    
    private func image(with image: UIImage?, scaledTo newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, _: false, _: 0.0)
        image?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
}



