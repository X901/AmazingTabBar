//
//  HomeViewController.swift
//  AmazingTabBar
//
//  Created by X901 on 4/30/17.
//  Copyright © 2017 Basil Baragabah. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    
    var newImage :String? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        if newImage != nil {
        
Image.image = UIImage(named: newImage!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
