//
//  StatisticsView.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg_dark")
                .ignoresSafeArea()
            
            Image("map")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity, alignment: .top)
            
            VStack {
                
                HStack {
                    
                    Text("My Statistics")
                        .foregroundColor(Color("bg_dark"))
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isEdit = true
                        
                    }, label: {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(Color("bg_dark"))
                            .font(.system(size: 16, weight: .bold))
                    })
                }
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Favorite weapon:")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.fav_weapon)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Favorite map:")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.fav_map)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                }
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Win rate:")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("\(viewModel.win_rate)%")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Headshot %:")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("\(viewModel.headshot)%")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                }
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Kill/Death ratio:")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 14, weight: .regular))
                    
                    Text(viewModel.kill_death_ratio)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Total MVPs:")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 14, weight: .regular))
                    
                    Text(viewModel.total_mvps)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Kill/Death ratio:")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 14, weight: .regular))
                    
                    Text(viewModel.kill_death_ratio)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Total kills:")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.total_kills)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Victories:")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(viewModel.total_victories)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_light")).ignoresSafeArea())
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .sheet(isPresented: $viewModel.isEdit, content: {
            
            StatisticsEdit(viewModel: viewModel)
        })
    }
}

#Preview {
    StatisticsView()
}
