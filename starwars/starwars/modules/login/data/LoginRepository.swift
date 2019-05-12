//
// Created by Carlos Leonardo Camilo Vargas Huamán on 2019-05-15.
// Copyright (c) 2019 orbis. All rights reserved.
//

import Foundation

/**
 * TODO Some responsibilities
 * You can use it in the Activity directly
 * Repository that handles login data. It knows what data sources need to be
 * triggered to login and where to store the data, once the user was logged in.
 *
 * Class that requests users from the remote data source and caches them, in memory.
 */
class LoginRepository {

    func logout() {
        //localDataSource.logout()
        //remoteDataSource.logout()
    }

    func login() {
        //var result = remoteDataSource.login(username, password)
        //if(result == SUCCESS){
        // setLoggedInUser(result.data)}
        //return result
    }

    private func setLoggedInUser() {
        //localDataSource = data
    }

    //TODO for a user repository with its remote datasource
    func getUser(id: Int) {
        //get user from cache
        //if(notCachedUsers){
        //getAndCacheUsers()
        //}
        //read again from cache
        //return usersCached
    }

    func getAndCacheUsers(){
       //remoteDataSource.getUser(id)
    }
}