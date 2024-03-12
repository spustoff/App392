//
//  TabBar.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {

        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index

                }, label: {
                    
                    VStack(alignment: .center, spacing: 8) {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .font(.system(size: 11, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 26)
        .background(Color("bg_dark"))
    }
}

enum Tab: String, CaseIterable {
    
    case Statistics = "Statistics"
    
    case Games = "Games"
    
    case Inventory = "Inventory"

    case Settings = "Settings"
}

#Preview {
    
    ContentView()
}
