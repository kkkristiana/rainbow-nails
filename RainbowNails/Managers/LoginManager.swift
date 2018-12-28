//
//  LoginManager.swift
//  RainbowNails
//
//  Created by kristianaatasi on 11.10.18.
//  Copyright © 2018 com.ka.rainbow-nails. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginManager {
    
    static let sharedManager = LoginManager()
    
    func registerUser(with mail: String, password: String, completion: @escaping (Bool, Error?, String?) -> ()) {
        Auth.auth().createUser(withEmail: mail, password: password, completion: { (user, error) in
            if error != nil {
                completion(false, error!, nil)
            }
            else {
                completion(true, nil, user?.additionalUserInfo?.username)
            }
        })
    }
    
    func loginUser(with mail: String, password: String, completion: @escaping (Bool, Error?, String?) -> ()) {
        Auth.auth().signIn(withEmail: mail, password: password, completion: { (user, error) in
            if error != nil {
                completion(false, error!, nil)
            }
            else {
                completion(true, nil, user?.additionalUserInfo?.username)
            }
        })
    }
    
    func logout(completion: @escaping (Bool, Error?) -> ()) {
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        }
        catch {
            completion(false, error)
        }
    }
}

