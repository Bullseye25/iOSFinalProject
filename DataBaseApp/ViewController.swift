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
    
//    var results: [Result] = []
    var currentResult: Result?
    var results = [Result]()
    
//    var res = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getContent()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return results.count
    
    }
    
    //Builds the cell inside the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataViewCell
        {
            cell.load(results[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        currentResult = results[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue" {
            
            let detailViewController = segue.destination as? DetailsViewController
            
            detailViewController?.result = currentResult
        }
    }
    
    func getContent(){
        
        print("getContent called")
//        "https://randomuser.me/api/?seed=raza"
        
        let url = URL(string:"https://randomuser.me/api/?seed=raza")
        let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
            guard let json = (try?  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
                print("Not containing JSON")
                return
            }
            print(json)
            
            guard let result = json["results"] as? String else
            {
                print("Result Not Available")
                return
            }
            
            let email = result["email"] as? [String: Any]
            
            print(email)
        
        }
        
        task.resume()
        
        
        
        
//        let urlString = "https://randomuser.me/api/?seed=raza"
//        guard let url = URL(string: urlString)
//            else
//        {
//            print("URL Not Working")
//            return
//        }
//
//        print(url,"\n\n")
//
//        URLSession.shared.dataTask(with: url)
//        {
//            (data, _, err) in
//
//            DispatchQueue.main.async
//            {
//                if let err = err
//                {
//                    print("Failed to get data from url:", err)
//                    return
//                }
//
//                guard let data = data
//                    else
//                {
//                    print("Data Not Available")
//                    return
//                }
//
////                print(String(data: data, encoding: .utf8), "\n\n")
//
//                do
//                {
//                    let decoder = JSONDecoder()
////                    self.currentDatabase = try decoder.decode(Database.self, from: data)
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    self.res = [try decoder.decode(Result.self, from: data)]
//
//                    print(self.res[0].email)
//                }
//                catch let jsonErr
//                {
//                    print("Failed to decode: ", jsonErr)
//                }
//            }
//        }.resume()
        
    }
}

