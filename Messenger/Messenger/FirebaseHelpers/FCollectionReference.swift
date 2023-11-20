//
//  FCollectionReference.swift
//  Messenger
//
//  Created by Tanish Parmar on 10/10/23.
//

import Foundation
import Firebase

enum FCollectionReference:String{
    case User
    case Recent
    case Messages
    case Typing
    case Channel
}

func FirebaseReference(_ collectionReference: FCollectionReference)-> CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}
