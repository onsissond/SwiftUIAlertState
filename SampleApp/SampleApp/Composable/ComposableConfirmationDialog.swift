//
//  ComposableConfirmationDialog.swift
//  SampleApp
//
//  Created by Sukhanov Evgeny on 10.01.2022.
//

import SwiftUI
import ComposableArchitecture

struct ComposableConfirmationDialog: View {
    @State var store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Button("Show alert") {
                viewStore.send(.showConfirmationDialog)
            }
            .confirmationDialog(
                store.scope(state: \.confirmationDialog),
                dismiss: .alertAction(.dismiss)
            )
        }
    }
}

struct ComposableConfirmationDialog_Previews: PreviewProvider {
    static var previews: some View {
        ComposableAlertView(store: .init(
            initialState: .init(),
            reducer: .empty,
            environment: Void()
        ))
    }
}
