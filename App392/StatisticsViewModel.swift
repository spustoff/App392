//
//  StatisticsViewModel.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

final class StatisticsViewModel: ObservableObject {
    
    @Published var isEdit: Bool = false
    
    @AppStorage("fav_weapon") var fav_weapon: String = "------"
    @AppStorage("fav_map") var fav_map: String = "------"
    @AppStorage("win_rate") var win_rate: String = "------"
    @AppStorage("headshot") var headshot: String = "------"
    @AppStorage("kill-death-ratio") var kill_death_ratio: String = "------"
    @AppStorage("total_mvps") var total_mvps: String = "------"
    @AppStorage("total_kills") var total_kills: String = "------"
    @AppStorage("total_victories") var total_victories: String = "------"
}
