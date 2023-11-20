//
//  AddProductViewController.swift
//  ShoppingApp
//
//  Created by Tanish Parmar on 06/11/23.
//

import UIKit

struct AddProduct: Encodable{
    let title: String
}

struct ProductResponse: Decodable{
    let id: Int
    let title: String
}

class AddProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addProduct()
    }

    func addProduct(){
        guard let url = URL(string: "https://dummyjson.com/products/add") else { return }
        let parameters =  AddProduct(title: "BMW Bike")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.httpBody = try? JSONEncoder().encode(parameters)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            do{
                let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                print(productResponse)
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
