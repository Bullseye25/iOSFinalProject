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
    
    var results: [Result] = []
    var currentResult: Result?
    
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
    
//    var emailArray = [String]()
    func getContent(){
        
        print("getContent called")
//        "https://randomuser.me/api/?seed=raza"
        
        var emailArray: String?
//        var _name: Name?
        
        let url = NSURL(string: "https://randomuser.me/api/?seed=raza")

        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in

            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary
            {
                //printing the json in console
                print(jsonObj!.value(forKey: "results")!, "\n\n")

                //getting the results tag array from json and converting it to NSArray
                if let _results = jsonObj!.value(forKey: "results") as? NSArray
                {
                    //looping through all the elements
                    for res in _results
                    {
                        //converting the element to a dictionary
                        if let resDict = res as? NSDictionary
                        {
                            for name in resDict.dictionaryWithValues(forKeys: ["name"])
                            {
                                print(name.value, "\n\n")
                            }
                            
                            let n = resDict.mutableSetValue(forKey: "name")

                            print(n, "\n\n")

                            let _name = resDict.value(forKey: "name")
                            
                            print(_name, "\n\n")
                            
                            
                            //getting the name from the dictionary
                            if let email = resDict.value(forKey: "email")
                            {
                                //adding the email to the array
                                emailArray = email as? String
                                print(emailArray!)
                            }
                        }
                    }
                }

//                OperationQueue.main.addOperation({
//                    //calling another function after fetching the json
//                    //it will show the names to label
//                    self.showNames()
//                })
            }
        }).resume()


        //works
//        let url = NSURL(string: "https://randomuser.me/api/?seed=raza")
//
//        //fetching the data from the url
//        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
//
//            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
//
//                //printing the json in console
//                print(jsonObj!.value(forKey: "results")!)
//
//                //getting the results tag array from json and converting it to NSArray
//                if let _results = jsonObj!.value(forKey: "results") as? NSArray {
//                    //looping through all the elements
//                    for res in _results{
//
//                        //converting the element to a dictionary
//                        if let resDict = res as? NSDictionary {
//
//                            //getting the name from the dictionary
//                            if let name = resDict.value(forKey: "email") {
//
//                                //adding the email to the array
//                                self.emailArray.append((name as? String)!)
//                            }
//
//                        }
//                    }
//                }
//
//                OperationQueue.main.addOperation({
//                    //calling another function after fetching the json
//                    //it will show the names to label
//                    self.showNames()
//                })
//            }
//        }).resume()
    
    
    
        
//        let url = URL(string:"https://randomuser.me/api/?seed=raza")
//        let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
//            guard let json = (try?  JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [Result] else {
//                print("Not containing JSON")
//                return
//            }
////            print(json)
//
//            guard let result = json as? [Result] else
//            {
//                print("Result Not Available")
//                return
//            }
//
//            print(result as AnyObject)
//
//        }
//
//        task.resume()
        
        
        
        
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
    
    func showNames(){
        //looing through all the elements of the array
//        for email in emailArray{
//
//            //appending the names to label
//            //            labelTest.text = labelTest.text! + email + "\n";
//
//            print(email);
//        }
    }
}

