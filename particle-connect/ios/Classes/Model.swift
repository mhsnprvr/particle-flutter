//
//  Model.swift
//  Runner
//
//  Created by link on 2022/10/8.
//

import ConnectCommon
import Foundation
import ParticleConnect
import ParticleNetworkBase

extension NSObject {
    func matchChain(name: String, chainId: Int) -> ParticleNetwork.ChainInfo? {
        var chainInfo: ParticleNetwork.ChainInfo?

        if name == "solana" {
            if chainId == 101 {
                chainInfo = .solana(.mainnet)
            } else if chainId == 102 {
                chainInfo = .solana(.testnet)
            } else if chainId == 103 {
                chainInfo = .solana(.devnet)
            }
        } else if name == "ethereum" {
            if chainId == 1 {
                chainInfo = .ethereum(.mainnet)
            } else if chainId == 5 {
                chainInfo = .ethereum(.goerli)
            }
        } else if name == "bsc" {
            if chainId == 56 {
                chainInfo = .bsc(.mainnet)
            } else if chainId == 97 {
                chainInfo = .bsc(.testnet)
            }
        } else if name == "polygon" {
            if chainId == 137 {
                chainInfo = .polygon(.mainnet)
            } else if chainId == 80001 {
                chainInfo = .polygon(.mumbai)
            }
        } else if name == "avalanche" {
            if chainId == 43114 {
                chainInfo = .avalanche(.mainnet)
            } else if chainId == 43113 {
                chainInfo = .avalanche(.testnet)
            }
        } else if name == "fantom" {
            if chainId == 250 {
                chainInfo = .fantom(.mainnet)
            } else if chainId == 4002 {
                chainInfo = .fantom(.testnet)
            }
        } else if name == "arbitrum" {
            if chainId == 42161 {
                chainInfo = .arbitrum(.one)
            } else if chainId == 42170 {
                chainInfo = .arbitrum(.nova)
            } else if chainId == 421613 {
                chainInfo = .arbitrum(.goerli)
            }
        } else if name == "moonbeam" {
            if chainId == 1284 {
                chainInfo = .moonbeam(.mainnet)
            } else if chainId == 1287 {
                chainInfo = .moonbeam(.testnet)
            }
        } else if name == "moonriver" {
            if chainId == 1285 {
                chainInfo = .moonriver(.mainnet)
            } else if chainId == 1287 {
                chainInfo = .moonriver(.testnet)
            }
        } else if name == "heco" {
            if chainId == 128 {
                chainInfo = .heco(.mainnet)
            } else if chainId == 256 {
                chainInfo = .heco(.testnet)
            }
        } else if name == "aurora" {
            if chainId == 1313161554 {
                chainInfo = .aurora(.mainnet)
            } else if chainId == 1313161555 {
                chainInfo = .aurora(.testnet)
            }
        } else if name == "harmony" {
            if chainId == 1666600000 {
                chainInfo = .harmony(.mainnet)
            } else if chainId == 1666700000 {
                chainInfo = .harmony(.testnet)
            }
        } else if name == "kcc" {
            if chainId == 321 {
                chainInfo = .kcc(.mainnet)
            } else if chainId == 322 {
                chainInfo = .kcc(.testnet)
            }
        } else if name == "optimism" {
            if chainId == 10 {
                chainInfo = .optimism(.mainnet)
            } else if chainId == 420 {
                chainInfo = .optimism(.goerli)
            }
        } else if name == "platon" {
            if chainId == 210425 {
                chainInfo = .platON(.mainnet)
            } else if chainId == 2206132 {
                chainInfo = .platON(.testnet)
            }
        } else if name == "tron" {
            if chainId == 728126428 {
                chainInfo = .tron(.mainnet)
            } else if chainId == 2494104990 {
                chainInfo = .tron(.shasta)
            } else if chainId == 3448148188 {
                chainInfo = .tron(.nile)
            }
        } else if name == "okc" {
            if chainId == 66 {
                chainInfo = .okc(.mainnet)
            } else if chainId == 65 {
                chainInfo = .okc(.testnet)
            }
        } else if name == "thundercore" {
            if chainId == 108 {
                chainInfo = .thunderCore(.mainnet)
            } else if chainId == 18 {
                chainInfo = .thunderCore(.testnet)
            }
        } else if name == "cronos" {
            if chainId == 25 {
                chainInfo = .okc(.mainnet)
            } else if chainId == 338 {
                chainInfo = .okc(.testnet)
            }
        } else if name == "oasisemerald" {
            if chainId == 42262 {
                chainInfo = .oasisEmerald(.mainnet)
            } else if chainId == 42261 {
                chainInfo = .oasisEmerald(.testnet)
            }
        } else if name == "gnosis" {
            if chainId == 100 {
                chainInfo = .gnosis(.mainnet)
            } else if chainId == 10200 {
                chainInfo = .gnosis(.testnet)
            }
        } else if name == "celo" {
            if chainId == 42220 {
                chainInfo = .celo(.mainnet)
            } else if chainId == 44787 {
                chainInfo = .celo(.testnet)
            }
        } else if name == "klaytn" {
            if chainId == 8217 {
                chainInfo = .klaytn(.mainnet)
            } else if chainId == 1001 {
                chainInfo = .klaytn(.testnet)
            }
        } else if name == "scroll" {
            if chainId == 534353 {
                chainInfo = .scroll(.testnet)
            }
        } else if name == "zksync" {
            if chainId == 324 {
                chainInfo = .zkSync(.mainnet)
            } else if chainId == 280 {
                chainInfo = .zkSync(.testnet)
            }
        } else if name == "metis" {
            if chainId == 1088 {
                chainInfo = .metis(.mainnet)
            } else if chainId == 599 {
                chainInfo = .metis(.goerli)
            }
        }
        return chainInfo
    }

    func matchChain(name: String) -> ParticleNetwork.Chain? {
        var chain: ParticleNetwork.Chain?

        if name == "solana" {
            chain = .solana
        } else if name == "ethereum" {
            chain = .ethereum
        } else if name == "bsc" {
            chain = .bsc
        } else if name == "polygon" {
            chain = .polygon
        } else if name == "avalanche" {
            chain = .avalanche
        } else if name == "fantom" {
            chain = .fantom
        } else if name == "arbitrum" {
            chain = .arbitrum
        } else if name == "moonbeam" {
            chain = .moonbeam
        } else if name == "moonriver" {
            chain = .moonriver
        } else if name == "heco" {
            chain = .heco
        } else if name == "aurora" {
            chain = .aurora
        } else if name == "harmony" {
            chain = .harmony
        } else if name == "kcc" {
            chain = .kcc
        } else if name == "optimism" {
            chain = .optimism
        } else if name == "platon" {
            chain = .platON
        } else if name == "tron" {
            chain = .tron
        } else if name == "okc" {
            chain = .okc
        } else if name == "thundercore" {
            chain = .thunderCore
        } else if name == "cronos" {
            chain = .cronos
        } else if name == "oasisemerald" {
            chain = .oasisEmerald
        } else if name == "gnosis" {
            chain = .gnosis
        } else if name == "celo" {
            chain = .celo
        } else if name == "klaytn" {
            chain = .klaytn
        } else if name == "scroll" {
            chain = .scroll
        } else if name == "zksync" {
            chain = .zkSync
        } else if name == "metis" {
            chain = .metis
        }
        return chain
    }

    func ResponseFromError(_ error: Error) -> FlutterResponseError {
        if let responseError = error as? ParticleNetwork.ResponseError {
            return FlutterResponseError(code: responseError.code, message: responseError.message ?? "", data: responseError.data)
        } else if let error = error as? ConnectError {
            return FlutterResponseError(code: error.code, message: error.message!, data: nil)
        } else {
            return FlutterResponseError(code: nil, message: String(describing: error), data: nil)
        }
    }

    public func map2WalletType(from string: String) -> WalletType? {
        let str = string.lowercased()
        var walletType: WalletType?
        if str == "particle" {
            walletType = .particle
        } else if str == "evmprivatekey" {
            walletType = .evmPrivateKey
        } else if str == "solanaprivatekey" {
            walletType = .solanaPrivateKey
        } else if str == "metamask" {
            walletType = .metaMask
        } else if str == "rainbow" {
            walletType = .rainbow
        } else if str == "trust" {
            walletType = .trust
        } else if str == "imtoken" {
            walletType = .imtoken
        } else if str == "bitkeep" {
            walletType = .bitkeep
        } else if str == "walletconnect" {
            walletType = .walletConnect
        } else if str == "phantom" {
            walletType = .phantom
        } else if str == "zerion" {
            walletType = .zerion
        } else if str == "math" {
            walletType = .math
        } else if str == "omni" {
            walletType = .omni
        } else if str == "zengo" {
            walletType = .zengo
        } else if str == "alpha" {
            walletType = .alpha
        } else if str == "bitpie" {
            walletType = .bitpie
        } else if str == "inch1" {
            walletType = .inch1
        } else {
            walletType = nil
        } 

        return walletType
    }

    func map2ConnectAdapter(from walletType: WalletType) -> ConnectAdapter? {
        let adapters = ParticleConnect.getAllAdapters().filter {
            $0.walletType == walletType
        }
        let adapter = adapters.first
        return adapter
    }
}

struct FlutterResponseError: Codable {
    let code: Int?
    let message: String?
    let data: String?
}

struct FlutterStatusModel<T: Codable>: Codable {
    let status: Bool
    let data: T
}

struct FlutterConnectLoginResult: Codable {
    let message: String
    let signature: String
}

struct FlutterLoginListModel: Codable {
    let walletType: String
    let account: Account
}
