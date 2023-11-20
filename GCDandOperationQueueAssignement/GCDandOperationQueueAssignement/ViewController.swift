//
//  ViewController.swift
//  GCDandOperationQueueAssignement
//
//  Created by Tanish Parmar on 08/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let model = tableViewData[indexPath.row]
        cell.homeTeamLabel.text = "Home Team Matches: \(model.matchdetail.teamHome)"
        cell.awayTeamLabel.text = "Away Team Matches: \(model.matchdetail.teamAway)"
        cell.leagueLabel.text = "League: \(model.matchdetail.match.league)"
        cell.dateLabel.text = "Date: \(model.matchdetail.match.date)"
        cell.timeLabel.text = "Time: \(model.matchdetail.match.time)"
        cell.seriesNameLabel.text = "Series Name: \(model.matchdetail.series.name)"
        cell.seriesStatusLabel.text = "Stauts of Match: \(model.matchdetail.series.status)"
        cell.playerMatchLabel.text = "Player Match: \(model.matchdetail.playerMatch)"
        cell.venueNameLabel.text = "Venue: \(model.matchdetail.venue.name)"
        cell.resultLabel.text = "Result: \(model.matchdetail.result)"
        
        return cell
        

    }
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewData: [Model] = []


    
    let urlString1 = "https://demo.sportz.io/nzin01312019187360.json"
    let urlString2 = "https://demo.sportz.io/sapk01222019186652.json"
    
    let dispatchQueue =  DispatchQueue(label: "net.sportzinteractive.GCDandOperationQueueAssignment")
    
    let operationQueue = OperationQueue()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeAPICall1()
        makeAPICall2()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
    }
    //done using gcd
    func makeAPICall1() {
        dispatchQueue.async {
            if let url = URL(string: self.urlString1), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    do {
                        let model1 = try JSONDecoder().decode(Model.self, from: data)
                        self.tableViewData.append(model1)
                        self.tableView.reloadData()
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }
        }
    }
    //done using operation queue
    func makeAPICall2() {
        if let url = URL(string: urlString2) {
            let operation = BlockOperation {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        do {
                            let model2 = try JSONDecoder().decode(Model.self, from: data)
                            self.tableViewData.append(model2)
                            self.tableView.reloadData()
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
                }
            }
            operationQueue.addOperation(operation)
        }
    }
    
}

