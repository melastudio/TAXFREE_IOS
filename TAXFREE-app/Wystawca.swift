//
//  Wystawca.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 05.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import Foundation

class Wystawca {
    var id:Int64
    var nazwa:String
    var NIP:String
    var adres:Adres
    
    init(Id: Int64, Nazwa:String, NIP:String, Adres:Adres) {
        self.id = Id
        self.nazwa = Nazwa
        self.NIP = NIP
        self.adres = Adres
    }
}
