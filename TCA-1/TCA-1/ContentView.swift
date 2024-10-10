//
//  ContentView.swift
//  TCA-1
//
//  Created by 정의찬 on 9/3/24.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
    let store: StoreOf<Feature>
    
    var body: some View {
        WithViewStore(self.store,
                      observe: { $0 } , content: { viewStore in
            Section {
                VStack {
                    Text("\(viewStore.count)")
                    HStack {
                        Button(action: {
                            viewStore.send(.decrease)
                        }, label: {
                            Text("감소하기 버튼")
                        })
                        
                        Button(action: {
                            viewStore.send(.increase)
                        }, label: {
                            Text("증가하기 버튼")
                        })
                    }
                }
            }
        })
    }
}

#Preview {
    ContentView(store: Store(initialState: Feature.State(), reducer: {
        Feature()
    }))
}
