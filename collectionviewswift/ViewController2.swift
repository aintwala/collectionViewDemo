//
//  ViewController2.swift
//  collectionviewswift
//
//  Created by ami on 11/15/16.
//  Copyright © 2016 com.zaptechsolution. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UIScrollViewDelegate {
    
    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
    var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow,UIColor.black,UIColor.blue,UIColor.brown]
    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    var pageControl : UIPageControl = UIPageControl(frame:CGRect(x: 50, y: 300, width: 200, height: 50))
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configurePageControl()
        
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for index in 0..<colors.count {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.isPagingEnabled = true
            
            let subView = UIView(frame: frame)
            subView.backgroundColor = colors[index]
            self.scrollView .addSubview(subView)
        }
        let width1 = Int(self.scrollView.frame.size.width) * colors.count
        self.scrollView.contentSize = CGSize(width:width1 , height: Int(self.scrollView.frame.size.height))
        pageControl.addTarget(self, action: Selector(("changePage:")), for: UIControlEvents.valueChanged)
        
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = colors.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.black
        self.pageControl.currentPageIndicatorTintColor = UIColor.green
        self.view.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
