//
//  InventoryViewModel.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI
import CoreData

final class InventoryViewModel: ObservableObject {
    
    @Published var inventories: [InventoryModel] = []
    
    @Published var isAdd: Bool = false
    
    @Published var types: [String] = ["Weapons", "Cases"]
    @Published var current_type: String = "Weapons"
    
    @Published var type: String = ""
    @Published var name: String = ""
    @Published var price: String = ""
    
    func addInventory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "InventoryModel", into: context) as! InventoryModel

        loan.type = type
        loan.name = name
        loan.price = Int16(price) ?? 0

        CoreDataStack.shared.saveContext()
    }
    
    func fetchInventories() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<InventoryModel>(entityName: "InventoryModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.inventories = result.filter{$0.type == current_type}
            
        } catch _ as NSError {
            
            self.inventories = []
        }
    }
}
