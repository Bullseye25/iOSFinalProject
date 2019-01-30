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
    
    var result: [Result] = []
    var currentResult: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getContent()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return result.count
    
    }
    
    //Builds the cell inside the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as? DataViewCell
        {
            cell.load(result[indexPath.row], indexPath.row)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        currentResult = result[indexPath.row]
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
     
        let jsonUrlString = "https://randomuser.me/api/?seed=raza"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url){ (data, response, err) in
            
            guard let data = data else {
                print("Data not available")
                return
                
            }
            
            do{
                let database = try JSONDecoder().decode(Database.self, from: data)
                
                self.result.append(database.results![0])
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch let jsonErr
            {
                print("Unable to get the data \n\n", jsonErr)
            }
        }.resume()
        
    }
}
