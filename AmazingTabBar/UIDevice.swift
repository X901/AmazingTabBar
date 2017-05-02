//
//  UIDevice.swift
//  SwipedSignup
//
//  Created by X901 on 4/17/17.
//  Copyright © 2017 Basil Baragabah. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {

    
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case unknown
    }
    var screenType: ScreenType {
        guard iPhone else { return .unknown }
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 2208:
            return .iPhone6Plus
        default:
            return .unknown
            
        }
    }
}
