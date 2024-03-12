//
//  StatisticsEdit.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct StatisticsEdit: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: StatisticsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg_light")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 40, height: 5)
                    .padding(.vertical)
                
                ZStack {
                    
                    Text("Edit")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding([.horizontal, .bottom])
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Favorite Weapon")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.fav_weapon.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.fav_weapon)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Favorite Map")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.fav_map.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.fav_map)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Win Rate")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.win_rate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.win_rate)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Headshot %")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.headshot.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.headshot)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Kill/Death Ratio")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.kill_death_ratio.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.kill_death_ratio)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Total MVPs")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.total_mvps.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.total_mvps)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Total Kills")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.total_kills.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.total_kills)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Total Victories")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.total_victories.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.total_victories)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    StatisticsEdit(viewModel: StatisticsViewModel())
}
