//
//  ViewController.swift
//  TableViewAssignmentFinal
//
//  Created by Tanish Parmar on 11/10/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableCellTableViewCell
               cell.myLabel.text = "\(indexPath.row+1)" // Display the number at the current index
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.red
        }
        else{
            cell.backgroundColor = UIColor.yellow
        }
               return cell
    }
    
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.register(UINib(nibName: "MyTableCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
 
}

