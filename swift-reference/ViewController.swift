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
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    let wkview: WKWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let toggleSwitch = UISwitch(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    let disposeBag = DisposeBag()
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(toggleSwitch)
        
//        toggleSwitch.rx.isOn
//            .subscribe(onNext: { enabled in
//                print( enabled ? "it's ON" : "it's OFF" )
//            }).disposed(by: disposeBag)
        
        toggleSwitch.rx.isOn.subscribe(onNext: { (enabled) in
            print( enabled ? "it's ON" : "it's OFF" )
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }).disposed(by: disposeBag)
        
        
        Observable<Int>.range(start: 0, count: 10).subscribe(onNext: { (i) in
            let n = Double(i)
            let fibonacci = Int(((pow(1.61803, n) - pow(0.61803, n)) /
                2.23606).rounded())
            print(fibonacci)
        }).disposed(by: disposeBag)
        
        
        let observale = Observable<String>.create { (observer) -> Disposable in
            observer.onNext("xx")
            observer.onCompleted() // 约等于 observer.on(.completed)
            
            observer.on(.next("ele"))
            observer.on(.completed)
            
            return Disposables.create()
        }
        
        observale.subscribe(onNext: { (str) in
            print(str)
        }, onError: { (error) in
            print(error)
        }, onCompleted: {
            print("completed-i")
        }).disposed(by: disposeBag)
        
        let never = Observable<Any>.never()
        
        
        never.do(onNext: { (any) in
            print("do-next")
            print("\(any)")
        }, onError: { (error) in
            
        }, onCompleted: {
            
            print("do-completed")
            
        }, onSubscribe: {
            
            print("do-subscribe")

        }, onSubscribed: {
            
            print("do-subscribed")
            
        }, onDispose: {
            
            print("do-dispose")
            
        }).debug().subscribe(onNext: { (any) in
            
            print("subscribe-next")
            print("\(any)")
            
        }, onError: { (error) in
            
        }, onCompleted: {
            
            print("subscribe-Completed")
            
        }, onDisposed: {
            
            print("subscribe-Disposed")
            
        }).disposed(by: disposeBag)
        
        
//        let url = URL(string: "https://ss3.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=ed84f4d0c4fcc3ceabc0cf33a244d6b7/cefc1e178a82b901e004bbc17f8da9773812ef93.jpg")
//        image.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: { (i, j) in
//
//        }) { (image, error, type, url) in
//
//        }
//
//        Alamofire.request("https://httpbin.org/get").response { (response) in
//
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//
//                print("Data: \(utf8Text)")
//
//                let user = VersionResponse(JSONString: utf8Text)
//                print(user ?? "")
//            }
//
//
//        }
        
        
        // notification
        NotificationCenter.default.addObserver(forName: .UIKeyboardDidChangeFrame, object: nil, queue: nil) { (notification) in
            
        }
        
        
        
        
    }


}


public func test()  {
    print("test")
}

