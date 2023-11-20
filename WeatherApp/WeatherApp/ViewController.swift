//
//  ViewController.swift
//  WeatherApp
//
//  Created by Tanish Parmar on 26/10/23.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var updateTimeLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData(){
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=46d06fab1b594e38a9980638232610&q=Mumbai&aqi=no")
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data, error == nil else{
                print("Error occured while accessing data")
                return
            }
            var fullWeatherData: WeatherData?
            do{
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            }
            catch{
                print("Error occured while decoding JSON data \(error)")
            }
            DispatchQueue.main.async {
                self.updateTimeLabel.text = "Updated : \(fullWeatherData!.current.last_updated)"
                self.regionLabel.text = "Region : \(fullWeatherData!.location.region)"
                self.countryLabel.text = "Country : \(fullWeatherData!.location.country)"
                self.temperatureLabel.text = "Temp (C) : \(fullWeatherData!.current.temp_c)"
                self.windLabel.text = "Wind (kmph) :  \(fullWeatherData!.current.wind_kph)"
                self.humidityLabel.text = "Humidity : \(fullWeatherData!.current.humidity)"
                
            }
        }
        dataTask.resume()
    }

    //MARK: - IBActions
    

    @IBAction func refreshData(_ sender: Any) {
        fetchData()
    }
}

