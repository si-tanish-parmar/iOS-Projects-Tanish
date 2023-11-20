//
//  RealmManager.swift
//  Messenger
//
//  Created by Tanish Parmar on 16/10/23.
//

import Foundation
import RealmSwift

class RealmManager{
    static let shared = RealmManager()
    let realm = try! Realm()
    private init(){}
    func saveToRealm<T: Object>(_ object: T){
        do{
            try realm.write{
                realm.add(object,update: .all)
            }
        }
        catch{
            print("Error saving realm object ",error.localizedDescription)
        }
    }
}
