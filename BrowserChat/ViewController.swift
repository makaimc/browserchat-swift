//
//  ViewController.swift
//  BrowserChat
//
//  Created by Matthew Makai on 2/10/16.
//  Copyright © 2016 Matthew Makai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


  @IBOutlet var chatWindow: UITextView!
  @IBOutlet var chatControlsStackView: UIStackView!
  @IBOutlet var sendChatText: UITextField!
  @IBOutlet var sendButton: UIButton!
  
  @IBOutlet var browserControlsStackView: UIStackView!
  @IBOutlet var urlText: UITextField!
  @IBOutlet var goButton: UIButton!
  @IBOutlet var webBrowser: UIWebView!
  
  let purpleBox = UIView()
  let goldBox = UIView()
  

  let mainStackView = UIStackView()
  let chatStackView = UIStackView()
  let browserStackView = UIStackView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let url = NSURL(string: "https://www.twilio.com/blog")!
    webBrowser.loadRequest(NSURLRequest(URL: url))
    view.addSubview(mainStackView)
    
    purpleBox.backgroundColor = UIColor.purpleColor()
    goldBox.backgroundColor = UIColor.yellowColor()

    /*
    mainStackView.addArrangedSubview(purpleBox)
    mainStackView.addArrangedSubview(goldBox)
    */
    
    mainStackView.addArrangedSubview(chatStackView)
    mainStackView.addArrangedSubview(browserStackView)
    
    
    chatStackView.addArrangedSubview(chatWindow)
    chatStackView.addArrangedSubview(chatControlsStackView)
    
    browserStackView.addArrangedSubview(browserControlsStackView)
    browserStackView.addArrangedSubview(webBrowser)
    
    mainStackView.axis = UILayoutConstraintAxis.Vertical
    mainStackView.distribution = UIStackViewDistribution.FillEqually
    chatStackView.axis = UILayoutConstraintAxis.Vertical
    browserStackView.axis = UILayoutConstraintAxis.Vertical
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidLayoutSubviews() {
    let top = topLayoutGuide.length
    let bottom = bottomLayoutGuide.length
    mainStackView.frame = CGRect(x: 0, y: top, width: view.frame.width, height: view.frame.height - top - bottom).insetBy(dx: 0, dy: 0)
    
    dispatch_async(dispatch_get_main_queue())
      {
        if self.view.frame.height > self.view.frame.width
        {
          self.mainStackView.axis = UILayoutConstraintAxis.Vertical
        }
        else
        {
          self.mainStackView.axis = UILayoutConstraintAxis.Horizontal
        }
    }
  }


  func textFieldShouldReturn(textField: UITextField) -> Bool {
    let url = NSURL(string: textField.text!)!
    webBrowser.loadRequest(NSURLRequest(URL: url))
    return true
  }
}

