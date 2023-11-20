//
//  ViewController.swift
//  ChildViewControllerAssignment
//
//  Created by Tanish Parmar on 04/11/23.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var removeButton: UIButton!
    
    var childViewController: ChildViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.green
        
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        if childViewController == nil{
            childViewController = ChildViewController()
            addChild(childViewController!)
            childViewController?.view.frame = view.bounds
            view.addSubview(childViewController!.view)
            childViewController!.didMove(toParent: self)
        }
    }
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        if let childViewController = childViewController {
            childViewController.willMove(toParent: nil)
            childViewController.view.removeFromSuperview()
            childViewController.removeFromParent()
            self.childViewController = nil
        }
    }
}

