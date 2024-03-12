//
//  GamesViewModel.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI
import CoreData

final class GamesViewModel: ObservableObject {
    
    @Published var games: [GameModel] = []
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var selectedGame: GameModel? = nil
    
    @Published var types: [String] = ["Victories", "Defeats"]
    @Published var current_type: String = "Victories"
    
    @Published var img: String = ""
    @Published var name: String = ""
    @Published var date: Date = Date()
    @Published var time: Date = Date()
    @Published var status: String = ""
    @Published var type: String = ""
    @Published var kills: String = ""
    @Published var deaths: String = ""
    @Published var assists: String = ""
    
    func addGame() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GameModel", into: context) as! GameModel

        loan.img = img
        loan.name = name
        loan.date = date
        loan.time = time
        loan.status = status
        loan.type = type
        loan.kills = Int16(kills) ?? 0
        loan.deaths = Int16(deaths) ?? 0
        loan.assists = Int16(assists) ?? 0

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGames() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GameModel>(entityName: "GameModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.games = result.filter{$0.type == current_type}
            
        } catch _ as NSError {
            
            self.games = []
        }
    }
}
