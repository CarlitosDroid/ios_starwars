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

    var isDataLoading:Bool=false
    var pageNo:Int=0
    var limit:Int=20
    var offset:Int=0 //pageNo*limit
    var didEndReached:Bool=false

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.tableFooterView = UIView()

        getStarWarsPersons { (persons) in
            self.swPersons = persons
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail" {
            guard let data = sender as? Person else {
                return
            }
            guard let detailVC  = segue.destination as? DetailViewController else {
                return
            }
            detailVC.person = data
        }
    }


}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.swPersons.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = self.swPersons[indexPath.row].name
        return cell

    }


}
extension ViewController : UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goDetail", sender: self.swPersons[indexPath.row])
    }
}

extension ViewController {
    func getStarWarsPersons(_ callback: @escaping (_ persons: [Person]) -> Void) -> Void {
        let url     = URL(string: "https://swapi.co/api/people/")!
        let decoder = JSONDecoder()

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let result = try decoder.decode(Result.self, from: data)
                callback(result.results)
            } catch let err {
                print("error decoding", err)
            }
        }
        task.resume()
    }
}

extension ViewController {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    //Pagination
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        print("scrollViewDidEndDragging")
        /*i
         
         f ((tableView.contentOffset.y + tableView.frame.size.height) >= tableView.contentSize.height)
        {
            if !isDataLoading{
                isDataLoading = true
                self.pageNo=self.pageNo+1
                self.limit=self.limit+10
                self.offset=self.limit * self.pageNo
                loadCallLogData(offset: self.offset, limit: self.limit)
                
            }
        }*/


    }

}

class Person: Codable {
    var name:      String?
    var height:    String?
    var mass:      String?
    var gender:    String?
    var homeworld: String?

    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case gender
        case homeworld
    }
}
class Result: Codable {
    var results: [Person] = []
    enum CodingKeys: String, CodingKey {
        case results
    }
}



