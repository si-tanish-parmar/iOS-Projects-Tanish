//
//  ViewController.swift
//  BitcoinPriceTracker
//
//  Created by Tanish Parmar on 26/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btcPrice: UILabel!
    
    @IBOutlet weak var ethPrice: UILabel!
    
    @IBOutlet weak var usdPrice: UILabel!
    
    @IBOutlet weak var audPrice: UILabel!
    
    @IBOutlet weak var lastUpdatedPriceLabel: UILabel!
    
    let urlString = "https://api.coingecko.com/api/v3/exchange_rates"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        let url = URL(string: urlString)
        let defaultSession =  URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            if (error != nil){
                print(error)
                return
            }
            do{
                let json =  try JSONDecoder().decode(Rates.self, from: data!)
                self.setPrices(currency: json.rates)
            }
            catch{
                print(error.localizedDescription)
                return
            }
        }
        
    }
    
    func setPrices(currency: Currency){
        DispatchQueue.main.async{
            self.btcPrice.text = self.formatPrice(currency.btc)
            self.ethPrice.text = self.formatPrice(currency.eth)
            self.usdPrice.text = self.formatPrice(currency.usd)
            self.audPrice.text = self.formatPrice(currency.aud)
            self.lastUpdatedPriceLabel.text = self.formatDate(date: Date())
        }
        
    }
    
    func formatPrice(_ price: Price) -> String{
        return String(format: "%@ %.4f", price.unit, price.value)
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    struct Rates: Codable{
        let rates: Currency
    }
                        
    
    struct Currency: Codable{
        let btc: Price
        let eth: Price
        let usd: Price
        let aud: Price
    }
    
    struct Price: Codable{
        let name: String
        let unit: String
        let value: Float
        let type: String
    }


}

