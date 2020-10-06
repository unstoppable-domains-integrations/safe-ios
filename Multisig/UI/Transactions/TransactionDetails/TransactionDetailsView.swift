//
//  TransactionDetailsView.swift
//  Multisig
//
//  Created by Moaaz on 5/29/20.
//  Copyright © 2020 Gnosis Ltd. All rights reserved.
//

import SwiftUI

struct TransactionDetailsView: View {
    @ObservedObject
    var model: TransactionDetailsViewModel

    init(transaction: TransactionViewModel) {
        model = TransactionDetailsViewModel(transaction: transaction)
    }

    var body: some View {
        ZStack {
            LoadableView(TransactionDetailsBodyView(model: model), reloadsOnAppOpen: false)
        }
        .navigationBarTitle("Transaction Details", displayMode: .inline)
        .onAppear {
            self.trackEvent(.transactionsDetails)
        }
    }
}

struct TransactionDetailsBodyView: Loadable {
    @ObservedObject
    var model: TransactionDetailsViewModel

//    var transaction: TransactionViewModel {
//        model.transactionDetails
//    }

    var body: some View {
        List {
            if transaction as? CreationTransactionViewModel == nil {
                transactionDetailsBodyView
            }
        }
    }

    var transactionDetailsBodyView: some View {
        Group {
            TransactionStatusTypeView(transaction: model.transactionDetails)
        }
    }
}
