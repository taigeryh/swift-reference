//
//  ViewController.swift
//  swift-reference
//
//  Created by taiyh on 2018/7/2.
//  Copyright © 2018年 __ORGANIZATION__. All rights reserved.
//

import UIKit
import Alamofire
import WebKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    let wkview: WKWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = URL(string: "https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=ed84f4d0c4fcc3ceabc0cf33a244d6b7/cefc1e178a82b901e004bbc17f8da9773812ef93.jpg")
        image.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: { (i, j) in
            
        }) { (image, error, type, url) in
            
        }
        
        Alamofire.request("https://httpbin.org/get").response { (response) in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                
                print("Data: \(utf8Text)")
                
                let user = VersionResponse(JSONString: utf8Text)
                print(user ?? "")
            }
            
            
        }
        
    }


}


public func test()  {
    print("test")
}

