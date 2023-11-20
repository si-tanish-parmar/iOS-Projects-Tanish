//
//  ViewController.swift
//  ChildViewController
//
//  Created by Tanish Parmar on 03/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var firstChildVC = FirstChildViewController()
    private lazy var secondChildVC = SecondChildViewController()
    
//    private let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.isPagingEnabled = true
//        return scrollView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.contentSize = CGSize(width: view.frame.size.width*2, height: 0)
//        view.addSubview(scrollView)
        addChildVCs()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        scrollView.frame = view.bounds  //change this
        
    }
    
    private func addChildVCs(){
        addChild(firstChildVC)
        addChild(secondChildVC)
        view.addSubview(firstChildVC.view)
        view.addSubview(secondChildVC.view)
//        firstChildVC.view.frame = CGRect(x: 0 , y: 0 , width: scrollView.frame.size.width, height: scrollView.frame.size.height)
//        secondChildVC.view.frame = CGRect(x: scrollView.frame.size.width , y: 0 , width: scrollView.frame.size.width , height: scrollView.frame.size.height)
        
        firstChildVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/3)
        secondChildVC.view.frame = CGRect(x: 0, y: view.frame.size.height/3, width: view.frame.size.width, height: (view.frame.size.height/3)*2)
        firstChildVC.didMove(toParent: self)
        secondChildVC.didMove(toParent: self)
    }
    
    
//    @IBAction func didChangeSegmentControlValue(_ sender:  UISegmentedControl){
//        if sender.selectedSegmentIndex == 0{
//            scrollView.setContentOffset(.zero, animated: true)
//        }
//        else{
//            scrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0), animated: true)
//        }
//    }

}

