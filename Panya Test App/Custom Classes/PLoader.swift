//
//  PLoader.swift
//  Panya Test App
//
//  Created by Muhammad Waseem on 30/05/2019.
//  Copyright © 2019 Muhammad Waseem. All rights reserved.
//

import UIKit
import iProgressHUD

class PLoader {
    
    class func ShowLoader(view : UIView)  {
        let iprogress: iProgressHUD = iProgressHUD()
        iprogress.iprogressStyle = .horizontal
        iprogress.indicatorStyle = .circleStrokeSpin
        iprogress.isShowModal = false
        iprogress.boxSize = 30
        iprogress.captionSize = 15
        iprogress.indicatorSize = 50
        iprogress.attachProgress(toViews: view)
        view.showProgress()
        
    }
    
    class public func dismissLoader(view : UIView)  {
        view.dismissProgress()
    }
    
    
}
