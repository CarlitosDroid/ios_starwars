//
//  GetPeopleUseCase.swift
//  starwars
//
//  Created by Carlos Leonardo Camilo Vargas Huamán on 5/12/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import Foundation
import PromiseKit

/**
 * Use case that gets a [PeopleResponse] from [PeopleRepository] and transforms it to [People].
 */
class GetPeopleUseCase {

    private var peopleRepository: PeopleRepository

    init(_ peopleRepository: PeopleRepository) {
        self.peopleRepository = peopleRepository
    }

    func getPeople() -> Promise<[People]> {
        return self.peopleRepository.getPeople().map { peopleResponse in
            peopleResponse.results.map { (person: PeopleResponse.Person) in
                return People(name: person.name, gender: person.gender)
            }
        }
    }

}