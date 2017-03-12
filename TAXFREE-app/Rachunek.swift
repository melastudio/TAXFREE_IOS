//
//  Rachunek.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 05.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import Foundation

//https://granica.gov.pl/TaxFree/Services/ModulSprzedazy_v1.wsdl

enum Waluta {
    case PLN, EUR, CHF, GBP
}

class Rachunek {
    var wystawca: Wystawca
    var podrozny: Podrozny
    var nrRachunku: String?
    var wartosc: Float32?
    var kodWaluty: Waluta?
    var dataWystawienia:NSDate?
    var listaAsortymentu: [String]=[]
    var opisAsortymentu:String?
    
    init(wystawca: Wystawca,podrozny: Podrozny, nrRachunku: String,wartosc: Float32,kodWaluty:Waluta,dataWystawienia:NSDate,listaAsortymentu: [String],opisAsortymentu:String) {
        self.wystawca = wystawca
        self.podrozny=podrozny
        self.nrRachunku=nrRachunku
        self.wartosc=wartosc
        self.kodWaluty=kodWaluty
        self.dataWystawienia=dataWystawienia
        self.listaAsortymentu=listaAsortymentu
        self.opisAsortymentu=opisAsortymentu
    }
}


let pat = "\\b([a-z])\\.([a-z]{2,})@([a-z]+)\\.ac\\.uk\\b"
let testStr = "x.wu@strath.ac.uk, ak123@hotmail.com     e1s59@oxford.ac.uk, ee123@cooleng.co.uk, a.khan@surrey.ac.uk"
let regex = try! NSRegularExpression(pattern: pat, options: [])
//let matches = regex.matches(testStr, options: [], range: NSRange(location: 0, length: testStr.characters.count))
