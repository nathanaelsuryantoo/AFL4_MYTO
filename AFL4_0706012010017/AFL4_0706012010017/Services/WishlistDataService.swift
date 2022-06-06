//
//  WishlistDataService.swift
//  AFL4_0706012010017
//
//  Created by MacBook Pro on 06/06/22.
//

import Foundation
import CoreData

class WishlistDataService{
    private let container: NSPersistentContainer
    private let containerName: String = "WishlistContainer"
    private let entityName: String = "WishlistEntity"
    
    @Published var savedEntities: [WishlistEntity] = []
    
    init(){
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error{
                print("Error loading Core Data! \(error)")
            }
            self.getWishlist()
        }
    }
    
    func updateWishlist(coin: Coins, amount: Double){
        if let entity = savedEntities.first(where: { $0.coinID == coin.id}){
            if amount > 0{
                update(entity: entity, amount: amount)
            }else{
                remove(entity: entity)
            }
        }else{
            add(coin: coin, amount: amount)
        }
        
    }
    
    private func getWishlist(){
        let request = NSFetchRequest<WishlistEntity>(entityName: entityName)
        do{
           savedEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("Error fetching Wishlist Entities. \(error)")
        }
    }
    
    private func add(coin: Coins, amount: Double){
        let entity = WishlistEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: WishlistEntity, amount: Double){
        entity.amount = amount
        applyChanges()
    }
    
    private func remove(entity: WishlistEntity){
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save(){
        do{
            try container.viewContext.save()
        }catch{
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges(){
        save()
        getWishlist()
    }
}
