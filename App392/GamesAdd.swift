//
//  GamesAdd.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct GamesAdd: View {
    
    @StateObject var viewModel: GamesViewModel
    @Environment(\.presentationMode) var router
    
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
                    
                    Text("Add Game")
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
                        
                        Menu {
                            
                            ForEach(["game_img"], id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.img = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        } label: {
                            
                            if viewModel.img.isEmpty {
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.gray.opacity(0.3), lineWidth: 1)
                                    .frame(height: 150)
                                    .overlay (
                                    
                                        Image(systemName: "camera")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    )
                                
                            } else {
                                
                                Image(viewModel.img)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 150)
                            }
                        }
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            DatePicker(selection: $viewModel.date, displayedComponents: .date, label: {})
                                .labelsHidden()
                            
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            DatePicker(selection: $viewModel.time, displayedComponents: .hourAndMinute, label: {})
                                .labelsHidden()
                            
                            Spacer()
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        Menu {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.type = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                Text("Type")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text(viewModel.type.isEmpty ? "Select" : viewModel.type)
                                    .foregroundColor(viewModel.type.isEmpty ? .gray : .black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        }
                        
                        Menu {
                            
                            ForEach(["Ranked"], id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.status = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                Text("Status")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text(viewModel.status.isEmpty ? "Select" : viewModel.status)
                                    .foregroundColor(viewModel.status.isEmpty ? .gray : .black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        }
                        .padding(.bottom)
                        
                        HStack {
                            
                            Text("Kills")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.kills.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.kills)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        HStack {
                            
                            Text("Deaths")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.deaths.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.deaths)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        HStack {
                            
                            Text("Assists")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.assists.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.assists)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addGame()
                    viewModel.fetchGames()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.img = ""
                    viewModel.name = ""
                    viewModel.type = ""
                    viewModel.status = ""
                    viewModel.kills = ""
                    viewModel.deaths = ""
                    viewModel.assists = ""
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.img.isEmpty || viewModel.name.isEmpty || viewModel.type.isEmpty || viewModel.status.isEmpty || viewModel.kills.isEmpty || viewModel.deaths.isEmpty || viewModel.assists.isEmpty ? 0.5 : 1)
                .disabled(viewModel.img.isEmpty || viewModel.name.isEmpty || viewModel.type.isEmpty || viewModel.status.isEmpty || viewModel.kills.isEmpty || viewModel.deaths.isEmpty || viewModel.assists.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    GamesAdd(viewModel: GamesViewModel())
}
