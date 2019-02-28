//
//  ViewController.swift
//  starwars
//
//  Created by Irvin Leon on 2/28/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var swPersons : [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        getStarWarsPersons { (persons) in
            self.swPersons = persons
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
        
    }


}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.swPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = self.swPersons[indexPath.row].name
        return cell
    }
    
    
}
extension ViewController : UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}

extension ViewController{
    func getStarWarsPersons(_ callback:@escaping (_ persons:[Person])->Void) -> Void {
        let url = URL(string: "https://swapi.co/api/people/")!
        let decoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do{
                let result = try decoder.decode(Result.self, from: data)
                callback(result.results)
            }catch let err{
                print("error decoding",err)
            }
        }
        task.resume()
    }
}

class Person: Codable {
    var name:String?
    enum CodingKeys: String, CodingKey {
        case name
    }
}
class Result: Codable {
    var results: [Person] = []
    enum CodingKeys: String, CodingKey {
        case results
    }
}



