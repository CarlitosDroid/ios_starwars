//
//  SwapiService.swift
//  starwars
//
//  Created by Carlos Leonardo Camilo Vargas Huamán on 5/12/19.
//  Copyright © 2019 orbis. All rights reserved.
//

import Foundation
import PromiseKit

protocol SwapiService {
    func getPeople() -> Promise<PeopleResponse>
    func getPeopleById() -> PeopleDetailResponse
}
