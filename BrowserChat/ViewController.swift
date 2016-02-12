//
//  ViewController.swift
//  BrowserChat
//
//  Created by Matthew Makai on 2/10/16.
//  Copyright © 2016 Matthew Makai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet var urlBar: UITextField!
  @IBOutlet var webBrowser: UIWebView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    let url = NSURL(string: "https://www.twilio.com/blog/2015/12/designing-chat-applications-for-ios-using-swift.html")!
    webBrowser.loadRequest(NSURLRequest(URL: url))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func goURL(sender: AnyObject) {
    let url = NSURL(string: self.urlBar.text!)!
    webBrowser.loadRequest(NSURLRequest(URL: url))
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    let url = NSURL(string: textField.text!)!
    webBrowser.loadRequest(NSURLRequest(URL: url))
    return true
  }
}

