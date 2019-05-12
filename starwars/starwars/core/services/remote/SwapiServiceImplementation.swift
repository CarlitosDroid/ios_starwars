//
// Created by Carlos Leonardo Camilo Vargas Huamán on 2019-05-12.
// Copyright (c) 2019 orbis. All rights reserved.
//

import Foundation
import PromiseKit

class SwapiServiceImplementation: SwapiService {

    func getPeople() -> Promise<PeopleResponse> {
        return Promise { seal in
            let url = URL(string: "https://swapi.co/api/people/")!
            let decoder = JSONDecoder()

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                //TODO Why does this validation happen?
                /*guard let data = data else {
                    return
                }*/
                do {
                    let peopleResponse = try decoder.decode(PeopleResponse.self, from: data!)
                    seal.fulfill(peopleResponse)
                } catch let err {
                    seal.reject(NSError(
                            domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: err.localizedDescription])
                    )
                }
            }
            task.resume()
        }
    }

    func getPeopleById() -> PeopleDetailResponse {
        return PeopleDetailResponse()
    }

}
