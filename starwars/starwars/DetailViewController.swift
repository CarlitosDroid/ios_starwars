//
//  DetailViewController.swift
//  starwars
//
//  Created by Irvin Leon on 2/28/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var nameLabel:      UILabel!
    @IBOutlet weak var heightLabel:    UILabel!
    @IBOutlet weak var massLabel:      UILabel!
    @IBOutlet weak var genderLabel:    UILabel!
    @IBOutlet weak var homeWorldLabel: UILabel!
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text      = person.name
        heightLabel.text    = person.height
        massLabel.text      = person.mass
        homeWorldLabel.text = person.homeworld
        genderLabel.text    = person.gender
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
