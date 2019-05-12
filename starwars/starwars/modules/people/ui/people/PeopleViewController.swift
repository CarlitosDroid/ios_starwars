//
//  ViewController.swift
//  starwars
//
//  Created by Irvin Leon on 2/28/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import UIKit
import PromiseKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tvPeople: UITableView!

    var people: [People] = []

    lazy var swapiService = SwapiServiceImplementation()
    lazy var peopleRemoteDataSource = PeopleRemoteDataSource(swapiService)
    lazy var peopleRepository = PeopleRepository(peopleRemoteDataSource)
    lazy var getPeopleUseCase = GetPeopleUseCase(peopleRepository)

    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpViews()
        subscribeToPeople()
    }

    func settingUpViews() {
        //TableView
        tvPeople.dataSource = self
        tvPeople.delegate = self
        tvPeople.tableFooterView = UIView()
    }

    func subscribeToPeople() {
        getPeopleUseCase.getPeople().done { people in
            self.people = people
            self.tvPeople.reloadData()
        }.catch { error in
            print(error.localizedDescription)
        }
    }

}