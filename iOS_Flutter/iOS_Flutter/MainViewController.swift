//
//  MainViewController.swift
//  iOS_Flutter
//
//  Created by HaviLee on 2019/11/24.
//  Copyright © 2019 HaviLee. All rights reserved.
//

import Foundation
import UIKit
import Flutter
import FlutterPluginRegistrant

class MainViewController: UIViewController {
    
    var routeString: String?
    
    var flutterViewController: FlutterViewController?
    var messageChannel: FlutterBasicMessageChannel?
    lazy var nativeView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleR: UILabel = {
        let lazyView = UILabel(frame: .zero)
        lazyView.text = "接收Flutter传递的参数："
        return lazyView
    }()
    
    lazy var titleE: UILabel = {
        let lazyView = UILabel(frame: .zero)
        lazyView.font = UIFont.systemFont(ofSize: 9)
        lazyView.text = "EventChannel:"
        return lazyView
    }()
    
    lazy var inView: UITextField = {
        let lazyView = UITextField(frame: .zero)
        lazyView.borderStyle = .roundedRect
        return lazyView
    }()
    
    lazy var titleL: UILabel = {
        let lazyView = UILabel(frame: .zero)
        lazyView.text = "输入传递给Flutter参数："
        return lazyView
    }()
    
    lazy var result: UILabel = {
        let lazyView = UILabel(frame: .zero)
        lazyView.layer.borderWidth = 0.5
        lazyView.layer.borderColor = UIColor.red.cgColor
        return lazyView
    }()
    
    lazy var switchView: UISwitch = {
        let lazyView = UISwitch()
        return lazyView
    }()
    
    lazy var flutterView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        let left = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        self.navigationItem.leftBarButtonItem = left
        //
        view.addSubview(nativeView)
        nativeView.addSubview(titleL)
        nativeView.addSubview(inView)
        nativeView.addSubview(titleR)
        nativeView.addSubview(result)
        nativeView.addSubview(switchView)
        nativeView.addSubview(titleE)
        switchView.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleL)
            make.right.equalToSuperview().offset(-15)
            
        }
        
        titleE.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleL)
            make.right.equalTo(switchView.snp.left)
        }
        
        nativeView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(88)
            make.height.equalTo(200)
        }
        
        titleL.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(nativeView.snp.top)
            make.height.equalTo(50)
        }
        
        inView.snp.makeConstraints { (make) in
            make.left.equalTo(titleL)
            make.top.equalTo(titleL.snp.bottom)
            make.height.equalTo(40)
            make.right.equalToSuperview().offset(-15)
        }
        
        titleR.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(inView.snp.bottom)
            make.height.equalTo(30)
        }
        
        result.snp.makeConstraints { (make) in
            make.left.equalTo(titleL)
            make.top.equalTo(titleR.snp.bottom)
            make.height.equalTo(60)
            make.right.equalToSuperview().offset(-15)
        }
        
        view.addSubview(flutterView)
        
        flutterView.snp.makeConstraints { (make) in
            make.top.equalTo(nativeView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setFlutterView()
        initalChannel()
    }
    
    @objc func cancel() {
        dismiss(animated: true) {
            
        }
    }
    
}

extension MainViewController {
    
    func setFlutterView() {
        flutterViewController = FlutterViewController()
        GeneratedPluginRegistrant.register(with: flutterViewController!)
        flutterViewController!.setInitialRoute("hybird")
        flutterViewController!.view.frame = CGRect(x: 0, y: 200 + 88, width: view.frame.width, height: view.frame.height - 288)
        self.addChild(flutterViewController!)
        view.addSubview(flutterViewController!.view)
    }
}

extension MainViewController {
    
    //处理channel
    func initalChannel() {
        initMessageChannel()
    }
    
    func initMessageChannel() {
        messageChannel = FlutterBasicMessageChannel(name: "basicMessageChannel", binaryMessenger: flutterViewController! as! FlutterBinaryMessenger, codec: FlutterStringCodec.sharedInstance())
        messageChannel!.setMessageHandler { (message, reply) in
            reply("basicMessage:\(String(describing: message))")
        }
    }
    
    
}
