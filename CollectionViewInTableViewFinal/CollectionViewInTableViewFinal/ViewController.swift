//
//  ViewController.swift
//  CollectionViewInTableViewFinal
//
//  Created by Tanish Parmar on 02/11/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    
    var models = [DogModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHoundDogData()
        
//        models.append(Model(text: "First", imageName: "image_1"))
//        models.append(Model(text: "Second", imageName: "image_2"))
//        models.append(Model(text: "Third", imageName: "image_3"))
//        models.append(Model(text: "Fourth", imageName: "image_4"))
//        models.append(Model(text: "Fifth", imageName: "image_5"))
//        models.append(Model(text: "Sixth", imageName: "image_6"))
//        models.append(Model(text: "Seventh", imageName: "image_7"))
        
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        let dogModel = models[indexPath.row]
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    func fetchHoundDogData() {
            guard let url = URL(string: "https://dog.ceo/api/breed/hound/images") else { return }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, error == nil {
                    do {
                        let dogData = try JSONDecoder().decode(DogData.self, from: data)
                        let imageUrls = dogData.message ?? []
                        
                        // Create DogModel objects for each image URL
                        let dogModels = imageUrls.map { DogModel(text: "Hound Dog", imageUrl: $0) }
                        
                        DispatchQueue.main.async {
                            self.models = dogModels
                            self.table.reloadData()
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }
            task.resume()
        }
    

}


//struct Model{
//    let text: String
//    let imageName: String
//    
//    init(text: String, imageName: String) {
//        self.text = text
//        self.imageName = imageName
//    }
//}

struct DogModel {
    let text: String
    let imageUrl: String
}

struct DogData: Codable {
    let message: [String]?
    let status: String
}
