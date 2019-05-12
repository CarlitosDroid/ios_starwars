//
//  PeopleLocalDataSource.swift
//  starwars
//
//  Created by Carlos Leonardo Camilo Vargas Huamán on 5/12/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import Foundation

class PeopleLocalDataSource {

    var userDao: UserDao

    init(userDao: UserDao) {
        self.userDao = userDao
    }

    func getUser() {

    }
}