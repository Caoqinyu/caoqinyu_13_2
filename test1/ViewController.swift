//
//  ViewController.swift
//  test1
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 caoqinyu. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var webView: WKWebView!
    var textField: UITextField!
    @objc func freshWeb() {
        webView.reload()
    }
    
    @objc func forwardWeb() {
        webView.goForward()
    }
    
    @objc func backWeb() {
        webView.goBack()
    }
    
    @objc func goWeb() {
        if let url=URL(string: textField.text!){
            webView.load(URLRequest(url: url))
        }
        //        let path = textField.text ?? ""
        //        loadURL(path: path)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        let buttonHeight: CGFloat = 40
        let buttonWidth: CGFloat = width / 5
        
        webView = WKWebView(frame: CGRect(x: 0, y: (buttonHeight + 10) * 2, width: width, height: height - (buttonHeight + 10) * 2))
        self.view.addSubview(webView)
        if let url=URL(string: "https://www.163.com"){
            webView.load(URLRequest(url: url))
        
        textField = UITextField(frame: CGRect(x: 10, y: buttonHeight + 20, width: width / 5 * 4, height: buttonHeight))
        textField.placeholder = "www.baidu.com"
        textField.layer.borderWidth = 1
        textField.delegate = self
        textField.returnKeyType = .done
        self.view.addSubview(textField)
        
        let goBtn = UIButton(frame: CGRect(x: buttonWidth * 4 + 10, y: buttonHeight + 20, width: buttonWidth - 10, height: buttonHeight))
        goBtn.setTitle("GO", for: .normal)
        goBtn.setTitleColor(UIColor.cyan, for: .normal)
        goBtn.setTitleColor(UIColor.brown, for: .highlighted)
        goBtn.addTarget(self, action: #selector(goWeb), for: .touchUpInside)
        self.view.addSubview(goBtn)
        
        let backBtn = UIButton(frame: CGRect(x: 10, y: 20, width: buttonWidth, height: buttonHeight))
        backBtn.setTitle("back", for: .normal)
        backBtn.setTitleColor(UIColor.cyan, for: .normal)
        backBtn.setTitleColor(UIColor.brown, for: .highlighted)
        backBtn.addTarget(self, action: #selector(backWeb), for: .touchUpInside)
        self.view.addSubview(backBtn)
        
        let forwardBtn = UIButton(frame: CGRect(x: 20 + buttonWidth, y: 20, width: buttonWidth, height: buttonHeight))
        forwardBtn.setTitle("forward", for: .normal)
        forwardBtn.setTitleColor(UIColor.cyan, for: .normal)
        forwardBtn.setTitleColor(UIColor.brown, for: .highlighted)
        forwardBtn.addTarget(self, action: #selector(forwardWeb), for: .touchUpInside)
        self.view.addSubview(forwardBtn)
        
        let freshBtn = UIButton(frame: CGRect(x: 30 + buttonWidth * 2, y: 20, width: buttonWidth, height: buttonHeight))
        freshBtn.setTitle("刷新", for: .normal)
        freshBtn.setTitleColor(UIColor.cyan, for: .normal)
        freshBtn.setTitleColor(UIColor.brown, for: .highlighted)
        freshBtn.addTarget(self, action: #selector(freshWeb), for: .touchUpInside)
        self.view.addSubview(freshBtn)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
       
//    func loadURL(path: String) {
//        let url: URL?
//        if path.hasPrefix("http://") {
//            url = URL(string: path)
//        } else {
//            url = URL(string: "http://\(path)")
//        }
//        if url != nil {
//            let request = URLRequest(url: url!)
//            webView.load(request)
//        }
//    }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

