//
//  ViewController.swift
//  DataBaseApp
//
//  Created by Ammad Raza on 1/20/19.
//  Copyright © 2019 FP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var information: [Data] = []
    var currentData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getContent()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return information.count
    
    }
    
    //Builds the cell inside the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataViewCell
        {
            cell.load(information[indexPath.row])

            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        currentData = information[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue" {
            
//            let detailViewController = segue.destination as? DefaultViewController
            
//            detailViewController?.weather = currentWeather
        }
    }
    
    func getContent(){

        print("getContent Called \n")

        let url = URL(string:"https://randomuser.me/api/?seed=raza")
//        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Paris,fr&APPID=9921e65449f7fc07ad71b16619ae3bc5")

        let task = URLSession.shared.dataTask(with: url!)
        { (data,response,error) in
            guard let json =
                (try?  JSONSerialization.jsonObject(with: data!, options:
                JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any]
                else
            {
                print("Not containing JSON\n")
                return
            }

            print(json,"\n\n\n\n\n")

//            guard let results = json["results"] as? [String: Any] else
//            {
////                    var currentData: Data?
//                print("Not containing JSON\n")
//                return
//            }
            
            guard let title = json["title"] as? [String: Any] else
            {
                print(json["title"] as Any)
                return
            }
            
//            let title = name["title"] as? [String: Any]
//
//            print("title: ",title as? String)
            
        }
//            guard let main = json["main"] as? [String: Any] else
//            {
//                return
//            }
//
//            let currentTemp = Int(self.convertTemperature(main["temp"] as? Double ?? 0.0))
//            let temp_max = Int(self.convertTemperature(main["temp_max"] as? Double ?? 0.0))
//            let temp_min = Int(self.convertTemperature(main["temp_min"] as? Double ?? 0.0))
//            let humidity = Int(main["humidity"] as? Double ?? 0.0)
//            let wind = json["wind"] as? [String: Any]
//            let windSpeed = Int(wind?["speed"] as? Double ?? 0)
//            let weather = json["weather"] as? [String: Any]
//            let desc = weather?["desc"] as? String ?? ""
//            let image = UIImage(named: "ParisImage")
//            //            _ = #imageLiteral(resourceName: "ParisImage")
//
//
//            //            guard let windSpeed = wind?["speed"] as? Double else
//            //            {
//            //                return
//            //            }
//
//            //            print(cityName, currentTemp, windSpeed)
//
//            //            let newWeather = Weather(cityName: cityName, windSpeed: Int(windSpeed), temperature: Int(currentTemp))
//
//            let newWeather = Weather(cityName: cityName,
//                                     windSpeed: Int(windSpeed),
//                                     temperature: currentTemp,
//                                     image: image,
//                                     desc: desc,
//                                     temp_max: temp_max,
//                                     temp_min: temp_min,
//                                     humidity: humidity)
//
//            self.weather.append(newWeather)
//
//            //            print(json["main"] as? String)
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        task.resume()
    }
}

