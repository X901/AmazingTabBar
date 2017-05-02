//
//  ViewController.swift
//  AmazingTabBar
//
//  Created by X901 on 4/30/17.
//  Copyright © 2017 Basil Baragabah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Menu_: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var notificationViewController: UIViewController!
    var profileViewController: UIViewController!

    var viewControllers: [UIViewController]!

    var selectedIndex: Int = 0

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var Top_: NSLayoutConstraint!
    
    @IBOutlet weak var Leading_: NSLayoutConstraint!
    
    @IBOutlet weak var Trailing_: NSLayoutConstraint!
    
    
    @IBOutlet weak var rightButtons: UIStackView!
    @IBOutlet weak var leftButtons: UIStackView!
    
    @IBOutlet weak var MenuIcons: UIStackView!
    
    @IBOutlet weak var contentViewBottom: NSLayoutConstraint!

    
    
    
    var check = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        MenuIcons.alpha = 0
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeView")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "SearchView")
        notificationViewController = storyboard.instantiateViewController(withIdentifier: "NotificationView")
        profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileView")

        viewControllers = [homeViewController, searchViewController, notificationViewController, profileViewController]

        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])

        
positionVerticalView()
        
        
   
        
      
    }
    
    
    @IBAction func didPressTab(_ sender: UIButton) {
        
        let previousIndex = selectedIndex

        selectedIndex = sender.tag

        buttons[previousIndex].isSelected = false

        let previousVC = viewControllers[previousIndex]

        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()

        sender.isSelected = true

        let vc = viewControllers[selectedIndex]

        addChildViewController(vc)
        
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)

        vc.didMove(toParentViewController: self)

 
    }

    
    func checkIphoneScreanSize( ScreenType : String) -> (CGFloat,CGFloat)  {
        
        
        var leadingValue:CGFloat!
        var trailingValue:CGFloat!
        
        if UIDevice().screenType == .iPhone5 {
            
            leadingValue = 159
            trailingValue = 158
            
        }else if UIDevice().screenType == .iPhone6 {
         leadingValue = 186
         trailingValue = 186
            
        }else if UIDevice().screenType == .iPhone6Plus {
            
           leadingValue = 206
            trailingValue = 205        }
        
        return (leadingValue,trailingValue)
        
    }
    
    
    func positionVerticalView(){
        self.Leading_.constant =  self.checkIphoneScreanSize(ScreenType: UIDevice().screenType.rawValue).0
        
        self.Trailing_.constant =  self.checkIphoneScreanSize(ScreenType: UIDevice().screenType.rawValue).1
 
    }
    
    
    @IBAction func menuButton(_ sender: UIButton) {
        
        
        if check == true {
        
            showMenu()

        
        }else {
        
        hideMenu()
        
        
        
    }
    
    }
    
    func showMenu(){
        UIView.animate(withDuration: 0.3, animations: {
            
            self.Top_.constant = -50
            
            self.contentViewBottom.constant = 67
            
            
            
            self.view.layer.layoutIfNeeded()
            
        }) { (true) in
            UIView.animate(withDuration: 0.1, animations: {
                self.Menu_.transform = CGAffineTransform(scaleX: 1, y: 1.8)
                
            }, completion: { (true) in
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.Leading_.constant = 20
                    self.Trailing_.constant = 20
                    
                    self.rightButtons.alpha = 0
                    self.leftButtons.alpha = 0
                    self.MenuIcons.alpha = 1
                    
                    
                    self.view.layer.layoutIfNeeded()
                    
                    
                    
                    self.check = false
                    
                })
            })
        }
    }
    
    
    
    func hideMenu(){
        
        UIView.animate(withDuration: 0.3, animations: {
            
            
            
            self.positionVerticalView()
            
            
            
            self.rightButtons.alpha = 1
            self.leftButtons.alpha = 1
            self.MenuIcons.alpha = 0
            
            
            self.view.layer.layoutIfNeeded()
            
            
            
            
        }, completion: { (true) in
            
            
            UIView.animate(withDuration: 0.1, animations: {
                
                self.Menu_.transform = .identity
                
            }, completion: { (true) in
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.contentViewBottom.constant = 0
                    
                    self.Top_.constant = 8
                    
                    self.view.layer.layoutIfNeeded()
                    
                    self.check = true
                    
                })
                
                
                
                
            })
            
            
        })
        
        
        
        
        
    }

    func delayHideMenuForOneSec(){
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
            self.hideMenu()
            
        }
    }
    
    


    @IBAction func CameraButton(_ sender: UIButton) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        
        
        controller.newImage = "0"
        
        addChildViewController(controller)

        controller.view.frame = contentView.bounds
        contentView.addSubview(controller.view)

       delayHideMenuForOneSec()
    }
    
    @IBAction func StockButton(_ sender: UIButton) {
        
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        
        
        controller.newImage = "1"

        addChildViewController(controller)

        controller.view.frame = contentView.bounds
        contentView.addSubview(controller.view)

       delayHideMenuForOneSec()

        
    }
    
    
    @IBAction func PlayButton(_ sender: UIButton) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        
        
        controller.newImage = "2"
        
        addChildViewController(controller)

        controller.view.frame = contentView.bounds
        contentView.addSubview(controller.view)
        
       delayHideMenuForOneSec()
        
    }
    
    
    


}

