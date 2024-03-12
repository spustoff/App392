//
//  SettingsView.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg_light")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color("bg_dark").ignoresSafeArea())
                
                Button(action: {
                    
                    guard let url = URL(string: DataManager().usagePolicy) else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg_dark")))
                    .padding([.horizontal])
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Rate Us")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg_dark")))
                    .padding([.horizontal])
                })
                
                Button(action: {
                    
                    CoreDataStack.shared.deleteAllData()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Reset Progress")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg_dark")))
                    .padding([.horizontal])
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
