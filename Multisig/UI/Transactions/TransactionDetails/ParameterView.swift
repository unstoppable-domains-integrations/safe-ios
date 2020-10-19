//
//  ParameterView.swift
//  Multisig
//
//  Created by Moaaz on 8/21/20.
//  Copyright © 2020 Gnosis Ltd. All rights reserved.
//

import SwiftUI

struct ParameterView: View {
    let parameter: DataDecodedParameter
    var body: some View {
        VStack (alignment: .leading, spacing: 6) {
            Text("\(parameter.name)(\(parameter.type)):").body()
            ParameterValueView(value: parameter.value)
        }
    }
}