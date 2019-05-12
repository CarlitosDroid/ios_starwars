//
//  ProficientViewController.swift
//  starwars
//
//  Created by Irvin Leon on 2/28/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var homeWorldLabel: UILabel!

    var people: People!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = people.name
        genderLabel.text = people.gender
    }

}
