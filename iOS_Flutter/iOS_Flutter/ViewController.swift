//
//  ViewController.swift
//  Native_Flutter
//
//  Created by HaviLee on 2019/11/19.
//  Copyright © 2019 HaviLee. All rights reserved.
//

import UIKit
import FlutterPluginRegistrant
import SnapKit

class ViewController: UIViewController {
    
    lazy var textField: UITextField = {
        let lazyView = UITextField(frame: CGRect.zero)
        lazyView.placeholder = "请输入参数"
        lazyView.textAlignment = .center
        return lazyView
    }()
    
    override func viewDidLoad() {
        
        view.addSubview(textField)
        
        textField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(150)
            make.height.equalTo(55)
        }
        
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        button.setTitle("showFlutter", for: .normal)
        button.setTitleColor(.red, for: .normal)
        view.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(textField.snp.bottom).offset(15)
        }
        
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func showFlutter() {
        let vc = MainViewController()
        vc.routeString = textField.text
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
//        let fview = FlutterViewController()
//        fview.setInitialRoute("{route:hybird}")
//        self.present(fview, animated: true, completion: nil)
    }
    
}

