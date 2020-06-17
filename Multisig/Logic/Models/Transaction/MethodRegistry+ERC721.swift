//
//  MethodRegistry+ERC721.swift
//  Multisig
//
//  Created by Dmitry Bespalov on 15.06.20.
//  Copyright © 2020 Gnosis Ltd. All rights reserved.
//

import Foundation

extension MethodRegistry {

    enum ERC721 {

        struct SafeTransferFrom: SmartContractMethodCall {
            static let signature = MethodSignature("safeTransferFrom", "address", "address", "uint256")
            let from: Address
            let to: Address
            let tokenId: UInt256

            init?(data: TransactionData) {
                guard data == Self.signature,
                    let from = data.parameters[0].addressValue,
                    let to = data.parameters[1].addressValue,
                    let tokenId = data.parameters[2].uint256Value else {
                        return nil
                }
                (self.from, self.to, self.tokenId) = (from, to, tokenId)
            }
        }

        static func isValid(_ tx: Transaction) -> Bool {
            #warning("TODO: tx.contractInfo.type == ContractInfoType.ERC721")
            return tx.operation == .call &&
                tx.dataDecoded != nil &&
                SafeTransferFrom(data: tx.dataDecoded!) != nil
        }

    }

}