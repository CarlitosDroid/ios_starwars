//
// Created by Carlos Leonardo Camilo Vargas Huamán on 2019-05-16.
// Copyright (c) 2019 orbis. All rights reserved.
//

import UIKit

extension PeopleViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            guard let people = sender as? People else {
                return
            }
            guard let detailVC = segue.destination as? DetailViewController else {
                return
            }
            detailVC.people = people
        }
    }

}