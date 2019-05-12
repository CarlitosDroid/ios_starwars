//
//  PeopleRepository.swift
//  starwars
//
//  Created by Carlos Leonardo Camilo Vargas Huamán on 5/12/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import Foundation
import PromiseKit

class PeopleRepository {

    var peopleRemoteDataSource: PeopleRemoteDataSource

    init(_ peopleRemoteDataSource: PeopleRemoteDataSource) {
        self.peopleRemoteDataSource = peopleRemoteDataSource
    }

    func getPeople() -> Promise<PeopleResponse> {
        return peopleRemoteDataSource.getPeople()
    }

    func getUser() {
        // peopleLocalDataSource.getUser()
    }

}
