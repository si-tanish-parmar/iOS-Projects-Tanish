//
//  ViewController.swift
//  TableViewAssignment
//
//  Created by Tanish Parmar on 11/10/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
   
    
    var viewModel: NumberViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
    }
    
    fileprivate func setupInitialUI() {
        tableView.backgroundColor = .cyan
        
        let cellNib = UINib(nibName: "NumberTblCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "NumberTblCell")
        
        viewModel = NumberViewModel()
        
        tableView.dataSource = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfNumbers()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberTblCell", for: indexPath)
        if let customCell = cell as? NumberTblCell {
            let number = viewModel.number(at: indexPath.row)
            customCell.configureCell(number: number)
        }
        return cell
    }
}

