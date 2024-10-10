//
//  CustomTabBar.swift
//  TCAMovie
//
//  Created by 정의찬 on 10/6/24.
//

import SwiftUI
import ComposableArchitecture

struct TabBarView: View {
    let store: StoreOf<TabBarFeature>
    
    var body: some View {
        WithViewStore(
            self.store,
            observe: { $0 },
            content: { viewStore in
                NavigationStack {
                    VStack {
                        switch viewStore.selectedTab {
                        case .home:
                            Text("home")
                        case .glass:
                            Text("glass")
                        case .tag:
                            Text("Tag")
                        }
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                viewStore.send(.selectedTab(.home))
                            }) {
                                VStack {
                                    if viewStore.selectedTab == .home {
                                        Icon.clickedHome.image
                                    } else {
                                        Icon.home.image
                                    }
                                }
                            }
                            
                            Spacer().frame(width: 100)
                            
                            Button(action: {
                                viewStore.send(.selectedTab(.glass))
                            }) {
                                VStack {
                                    if viewStore.selectedTab == .glass {
                                        Icon.clickedGlass.image
                                    } else {
                                        Icon.glass.image
                                    }
                                }
                            }
                            
                            Spacer().frame(width: 100)
                            
                            Button(action: {
                                viewStore.send(.selectedTab(.tag))
                            }) {
                                VStack {
                                    if viewStore.selectedTab == .tag {
                                        Icon.clickedTag.image
                                        
                                    } else {
                                        Icon.tag.image
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color.black)
                    }
                }
            }
        )
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(
            store: Store(initialState: TabBarFeature.State(selectedTab: .home)) {
                TabBarFeature()
            }
        )
    }
}
