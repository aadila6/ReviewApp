//
//  Constants.swift
//  ReviewApp
//
//  Created by Adila on 8/3/20.
//  Copyright © 2020 Adila Abudureheman. All rights reserved.
//

import Foundation
//reviewlists.us1a.cloud.realm.io

struct Constants {
    // **** Realm Cloud Users:
    // **** Replace MY_INSTANCE_ADDRESS with the hostname of your cloud instance
    // **** e.g., "mycoolapp.us1.cloud.realm.io"
    // ****
    // ****
    // **** ROS On-Premises Users
    // **** Replace the AUTH_URL and REALM_URL strings with the fully qualified versions of
    // **** address of your ROS server, e.g.: "http://127.0.0.1:9080" and "realm://127.0.0.1:9080"

    static let MY_INSTANCE_ADDRESS = "reviewlists.us1a.cloud.realm.io" // <- update this
    static let AUTH_URL  = URL(string: "https://\(MY_INSTANCE_ADDRESS)")!
    static let REALM_URL = URL(string: "realms://\(MY_INSTANCE_ADDRESS)/ToDo")!
}
