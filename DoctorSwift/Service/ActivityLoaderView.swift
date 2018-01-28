//
//  ActivityLoaderView.swift
//  cowboyspot
//
//  Created by AMIR on 10/10/17.
//  Copyright © 2017 Offsureit. All rights reserved.
//

import UIKit

class ActivityLoaderView: UIView {

    var activityIndicator = UIActivityIndicatorView()
    let loadingView = UIView()
    let loadingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

    }
    
    
    fileprivate func commonInit(){

        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        let width: CGFloat = self.frame.size.width
        let height: CGFloat = 80
        var x = (UIScreen.main.bounds.size.width / 2) - (width / 2)
        var y = (UIScreen.main.bounds.size.height / 2) - (height / 2)
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        loadingView.backgroundColor = UIColor.clear
        loadingView.layer.cornerRadius = 10
        
        loadingLabel.frame = CGRect(x: 0, y: 55, width: width, height: 20)
        loadingLabel.textColor = UIColor.white
        loadingLabel.textAlignment = .center
        loadingLabel.numberOfLines = 1;
        loadingLabel.adjustsFontSizeToFitWidth = true
        loadingLabel.font = UIFont.systemFont(ofSize: 15.0)

        loadingView.addSubview(loadingLabel)
   
         x = (loadingView.bounds.size.width / 2) - 20
         y = (loadingView.bounds.size.height / 2) - 30
        
        activityIndicator.frame = CGRect(x: x, y: y, width: 40, height: 40)

        activityIndicator.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
   
        activityIndicator.hidesWhenStopped = true
        
        loadingView.addSubview(activityIndicator)
 
        self.addSubview(loadingView)

    }

    
    func showActivityIndicator(text: String) {
        
        DispatchQueue.main.async {
    
            self.loadingLabel.text = " " + text + " "
            
            self.activityIndicator.startAnimating()
            
            UIApplication.shared.keyWindow?.addSubview(self)
        }
        
       
    }
    
    func hideActivityIndicator() {
        
        DispatchQueue.main.async {
            
            self.activityIndicator.stopAnimating()
            self.removeFromSuperview()
        }
        
       
    }
    
  

}
