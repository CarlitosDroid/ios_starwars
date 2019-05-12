//
//  PeopleRemoteDataSource.swift
//  starwars
//
//  Created by Carlos Leonardo Camilo Vargas Huamán on 5/12/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import Foundation
import PromiseKit

class PeopleRemoteDataSource {

    var peopleService: SwapiService

    init(_ peopleService: SwapiService) {
        self.peopleService = peopleService
    }

    func getPeople() -> Promise<PeopleResponse> {
        return peopleService.getPeople()
    }

}
