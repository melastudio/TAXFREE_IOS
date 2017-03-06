//
//  Wystawca.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 05.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import Foundation

class Wystawca {
    var nazwa:String?
    var NIP:String?
    var adres:Adres?
    
    init(nazwa:String,NIP:String,adres:Adres) {
        self.nazwa = nazwa
        self.NIP = NIP
        self.adres = adres
    }
}
