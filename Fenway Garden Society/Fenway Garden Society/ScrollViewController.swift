//
//  ScrollViewController.swift
//  Fenway Garden Society
//
//  Created by Jason Lu on 3/25/2017.
//  Copyright © 2017 BU Global App Initiative. All rights reserved.

// Collaboration: 
// GAI 2017 Appathon
// Stephen Parish 
// Sanam Patel

// This file will enable the scrolling of the gardener biographies to be dynamic, so that when the user uses a sliding object (Scroll View)

// This file will also enable the user to zoom the gardener biographies so that if the text is too small, the user can read the text at a more mangeable font

// This file should be able to connect the main storyboard as a 
// UIScrollViewController

// References: (for the zooming aspect of the scroll view) 

/* https://www.raywenderlich.com/122139/uiscrollview-tutorial */

// (for building a general form / skeleton of the UIScrollView)

/* http://www.appcoda.com/uiscrollview-introduction/ */

// (for including the web view to add to the about page of FGS) 

/* https://developer.apple.com/reference/webkit/wkwebview */

import UIKit
import WebKit

// adding a delegate class to the scroll view
class ScrollViewController: UIViewController, UIScrollViewDelegate, WKUIDelegate {
    // properties 
    // declaring class global variables
        var scrollView: UIScrollView!
        var textView: UITextView!
    // make a new web view 
        var webView: WKWebView!
    
    // function to load the web view 
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        // create a web view 
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        // make a UI delegate for web view 
        // self-initialized
        webView.uiDelegate = self
        view = webView
    }

    // viewDidLoad function
    override func viewDidLoad() {
        // super viewDidLoad 
        super.viewDidLoad()
        /* Do any additional setup after loading the 
            view */
        
        // building the text view
        // set up the parameters for the font later
        textView = UITextView()
        textView.text = "Sans Serif"
        
        // bound the view (in case text gets out of frame)
        scrollView = UIScrollView(frame: view.bounds)
        // make the background color white 
        //scrollView.backgroundColor = UIColor.white
        // bound the content size of the view
        scrollView.contentSize = textView.bounds.size
        
        // wait for someone to figure this out
        
        // docuSign Senior Engineer Stephen: use
        // array format to deal with auto-resizing the 
        // width and height of the UIScrollView
        
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // adding the dimensions of the scroll view
        // 500 * 500 square by default 
        // mutable height
        let height = 500;
        // mutable width
        let width = 500;
        scrollView.contentOffset = CGPoint(x: height, y: width)
        
        // add the sub-image view 
        scrollView.addSubview(textView)
        // add the scrolling view 
        view.addSubview(scrollView)
        
        // additional functions for scaling 
        // and zooming in 
        // self initializing the view
        scrollView.delegate = self
        /* Commented to make the scrolling dynamic */
        
        // minimum zoom scale 
        // scrollView.minimumZoomScale = 0.1
        // maximum zoom scale 
        // scrollView.maximumZoomScale = 4.0
        // scaling 
        // scrollView.zoomScale = 1.0
        
        // default setting zoom scale 
        initZoomScale()
        
        // addition to hit the URL for the web view 
        let myURL = URL(string: "http://fenwayvictorygardens.org/")
        let request = URLRequest(url: myURL!)
        webView.load(request)
    }
    
    // function to compensate for the device orientation
    // (portrait / landscape) change
    override func viewWillLayoutSubviews() {
        initZoomScale()
    }
    
    // function to enable zooming in the scroll view
    private func viewForZooming(scrollView: UIScrollView) -> UIView? {
            return textView
    }
        
    // function to set the zoom scale
    func initZoomScale() {
        // setting the image view size
        let imgViewSize = textView.bounds.size
        // setting the scroll view size
        let scrollViewSize = scrollView.bounds.size
        // setting the scroll width scale
        let widthScale = scrollViewSize.width / imgViewSize.width
        // setting the scroll height scale
        let heightScale = scrollViewSize.height / imgViewSize.height
            
        // minimize the zooming scale
        scrollView.minimumZoomScale = min(widthScale, heightScale)
            
        // default zooming scale
        scrollView.zoomScale = 1.0
    }
    
    // centering function (if necessary)
    private func scrollViewDidZoom(scrollView: UIScrollView) {
        // setting the text view size
        let textViewSize = textView.frame.size
        // setting the scroll view size 
        let scrollViewSize = scrollView.bounds.size
        
        // adding for alignment (vertical)
        // let dimensions = (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let verticalAlignment = textViewSize.height < scrollViewSize.height ? (scrollViewSize.height - textViewSize.height) / 2 : 0
        let horizontalAlignment = textViewSize.width < scrollViewSize.width ? (scrollViewSize.width - textViewSize.width) / 2 : 0
        
        // set the insets for the zoom 
        // 4 coordinates for scrolling (for the user when scrolling gardener biographies)
        // top: scroll up
        // bottom: scroll down
        // left: scroll left
        // right: scroll up
        scrollView.contentInset = UIEdgeInsets(top: verticalAlignment, left: horizontalAlignment, bottom: verticalAlignment, right: horizontalAlignment)
    }
}

