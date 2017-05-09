//
//  RachunekDB.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 07.05.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import SQLite

class RachunekDB {

    static let instance = RachunekDB()
    private let db: Connection?
    private let podrozni = Table("podrozny")
    private let id = Expression<Int64>("id")
    private let imie = Expression<String?>("imie")
    private let nazwisko = Expression<String>("nazwisko")
    private let nrpaszportu = Expression<String>("nrpaszportu")
    
    private let sklepy = Table("wystawca")
    private let ids = Expression<Int64>("id")
    private let nazwa = Expression<String?>("nazwa")
    private let nip = Expression<String?>("nip")
    private let ulica = Expression<String?>("ulica")
    private let nrBudynku = Expression<String?>("nrBudynku")
    private let nrLokalu = Expression<String?>("nrLokalu")
    private let miejscowosc = Expression<String?>("miejscowosc")
    private let kodPocztowy = Expression<String?>("kodPocztowy")
    private let poczta = Expression<String?>("poczta")
    
    private let dokumentyTF = Table("rachunek")
    private let idr = Expression<Int64>("id")
    private let wystawca = Expression<Int64>("idwystawcy")
    private let podrozny = Expression<Int64>("idpodrozny")
    private let nrRachunku = Expression<String?>("nrrachunku")
    private let wartosc = Expression<Float64>("wartosc")
    private let kodWaluty = Expression<Waluta>("waluta")
    private let dataWystawienia = Expression<NSDate>("datawystawienia")
    private let listaAsortymentu = Expression<String?>("listaasortymentu")
    private let opisAsortymentu = Expression<String?>("opisasortymentu")
    private let datazgloszenia = Expression<NSDate>("datazgloszenia")
    
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/taxfree.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
        }
        
        createTablePodrozny()
    }
    
    func createTablePodrozny() {
        do {
            try db!.run(podrozni.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(imie)
                table.column(nazwisko)
                table.column(nrpaszportu, unique: true)
            })
        } catch {
            print("Unable to create table podrozny")
        }
    }
    
    func createTableSklep() {
        do {
            try db!.run(dokumentyTF.create(ifNotExists: true) { table in
                table.column(ids, primaryKey: true)
                table.column(nazwa)
                table.column(nip)
                table.column(ulica)
                table.column(nrBudynku)
                table.column(nrLokalu)
                table.column(miejscowosc)
                table.column(kodPocztowy)
                table.column(poczta)
            })
        } catch {
            print("Unable to create table wystawca")
        }
    }

    func createTableRachunek() {
        do {
            try db!.run(sklepy.create(ifNotExists: true) { table in
                table.column(idr, primaryKey: true)
                table.column(wystawca)
                table.column(podrozny)
                table.column(nrRachunku)
                table.column(wartosc)
                table.column(kodWaluty)
                table.column(dataWystawienia)
                table.column(listaAsortymentu)
                table.column(opisAsortymentu)
                table.column(datazgloszenia)
            })
        } catch {
            print("Unable to create table wystawca")
        }
    }
    

    func addPodrozny(Imie: String, Nazwisko: String, nrPaszportu: String) -> Int64? {
        do {
            let insert = podrozni.insert(imie <- Imie, nazwisko <- Nazwisko, nrpaszportu <- nrPaszportu)
            let id = try db!.run(insert)
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed to podrozny")
            return -1
        }
    }
    
    func addSklep(Nazwa: String, Nip: String, Ulica: String, NrBudynku: String, NrLokalu: String, Miejscowosc: String, KodPocztowy: String, Poczta: String) -> Int64? {
        do {
            let insert = sklepy.insert(nazwa <- Nazwa, nip <- Nip, ulica <- Ulica, nrBudynku <- NrBudynku, nrLokalu <- NrLokalu, miejscowosc <- Miejscowosc,kodPocztowy <- KodPocztowy, poczta <- Poczta)
            let id = try db!.run(insert)
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed to wystawca")
            return -1
        }
    }
    
    func getPodrozni() -> [Podrozny] {
        var podrozni = [Podrozny]()
        
        do {
            for podrozny in try db!.prepare(self.podrozni) {
                podrozni.append(Podrozny(
                    id: podrozny[id]!,
                    imie: podrozny[imie]!,
                    nazwisko: podrozny[nazwisko],
                    nrPaszportu: podrozny[nrpaszportu]))
            }
        } catch {
            print("Select failed from podrozny")
        }
        
        return podrozni
    }
    
    func deletePodrozny(cid: Int64) -> Bool {
        do {
            let podrozny = podrozni.filter(id == cid)
            try db!.run(podrozni.delete())
            return true
        } catch {
            print("Delete failed from podrozny")
        }
        return false
    }
    
    func updatePodrozny(cid:Int64, newPodrozny: Podrozny) -> Bool {
        let podrozny = podrozni.filter(id == cid)
        do {
            let update = podrozny.update([
                imie <- newPodrozny.imie,
                nazwisko <- newPodrozny.nazwisko!,
                nrpaszportu <- newPodrozny.nrPaszportu!
                ])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed in podrozny: \(error)")
        }
        
        return false
    }
}
