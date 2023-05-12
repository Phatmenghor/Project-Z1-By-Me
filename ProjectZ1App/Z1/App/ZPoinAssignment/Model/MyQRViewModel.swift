//
//  MyQRViewModel.swift
//  ProjectZ1App
//
//  Created by PHAT MENGHOR on 4/24/23.
//

import UIKit

struct MyQRViewModel {
    let nameUserAccountBalance: String
    let imageAccountBalance: String
    let nameAccountBalance: String
    let numberAccountBalance: String
    let roleInAccountBalance: String
    let moneyAccountBalance: String
    let iconSelect: String
    let imageMyQR: String
    var isSelect: Bool
    var backgroundColor: UIColor
    
    init(nameUserAccountBalance: String, imageAccountBalance: String, nameAccountBalance: String, numberAccountBalance: String, roleInAccountBalance: String, moneyAccountBalance: String, iconSelect: String, imageMyQR: String, isSelect: Bool, backgroundColor: UIColor) {
        self.nameUserAccountBalance = nameUserAccountBalance
        self.imageAccountBalance = imageAccountBalance
        self.nameAccountBalance = nameAccountBalance
        self.numberAccountBalance = numberAccountBalance
        self.roleInAccountBalance = roleInAccountBalance
        self.moneyAccountBalance = moneyAccountBalance
        self.iconSelect = iconSelect
        self.imageMyQR = imageMyQR
        self.isSelect = isSelect
        self.backgroundColor = backgroundColor
    }
    
}

//
//  MyQRViewModel.swift
//  ProjectZ1App
//
//  Created by PHAT MENGHOR on 4/24/23.
//
    
    struct ZpoinAssModel: Codable {
        let success: Bool
        let message: String
        let code: Int
        let data: DataClass
    }

    // MARK: - DataClass
    struct DataClass: Codable {
        let totalBalanceByCurrency: [TotalBalanceByCurrency]
        let wallets: [Wallet]
        let userWallet: UserWallet

        enum CodingKeys: String, CodingKey {
            case totalBalanceByCurrency = "total_balance_by_currency"
            case wallets
            case userWallet = "user_wallet"
        }
    }

    // MARK: - TotalBalanceByCurrency
    struct TotalBalanceByCurrency: Codable {
        let key, value: String
    }

    // MARK: - UserWallet
    struct UserWallet: Codable {
        let id: Int
        let name: String
        let avatarOriginal: JSONNull?
        let isShop, checkPinCode: Bool

        enum CodingKeys: String, CodingKey {
            case id, name
            case avatarOriginal = "avatar_original"
            case isShop = "is_shop"
            case checkPinCode = "check_pin_code"
        }
    }

    // MARK: - Wallet
    struct Wallet: Codable {
        let id: Int
        let gid, accountNumber, walletAccountNumber: String
        let balance: Double
        let balanceNumFormat, name: String
        let type: TypeClass
        let currency: Currency
        let configs: [Config]
        let rules: Rules
        let isShare: Bool

        enum CodingKeys: String, CodingKey {
            case id, gid
            case accountNumber = "account_number"
            case walletAccountNumber = "wallet_account_number"
            case balance
            case balanceNumFormat = "balance_num_format"
            case name, type, currency, configs, rules, isShare
        }
    }

    // MARK: - Config
    struct Config: Codable {
        let id: Int
        let name, description: String
        let active: Bool
        let logo: Logo
        let color, url, iosClass, androidClass: String
        let type: String
        let position, requireAuthentication, hideService: JSONNull?
        let subService: SubService?

        enum CodingKeys: String, CodingKey {
            case id, name, description, active, logo, color, url
            case iosClass = "ios_class"
            case androidClass = "android_class"
            case type, position
            case requireAuthentication = "require_authentication"
            case hideService = "hide_service"
            case subService = "sub_service"
        }
    }

    // MARK: - Logo
    struct Logo: Codable {
        let small, medium, large: String
        let original: String
    }

    // MARK: - SubService
    struct SubService: Codable {
        let dailyStaking, fixedStaking: Bool

        enum CodingKeys: String, CodingKey {
            case dailyStaking = "daily_staking"
            case fixedStaking = "fixed_staking"
        }
    }

    // MARK: - Currency
    struct Currency: Codable {
        let id: Int
        let currencyCode, name: String

        enum CodingKeys: String, CodingKey {
            case id
            case currencyCode = "currency_code"
            case name
        }
    }

    // MARK: - Rules
    struct Rules: Codable {
        let receive, transfer, cashout, loyaltyToSalary: Bool
        let salaryToLoyalty: Bool

        enum CodingKeys: String, CodingKey {
            case receive, transfer, cashout
            case loyaltyToSalary = "loyalty_to_salary"
            case salaryToLoyalty = "salary_to_loyalty"
        }
    }

    // MARK: - TypeClass
    struct TypeClass: Codable {
        let id, name: String
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public func hash(into hasher: inout Hasher) {
              hasher.combine(0)
          }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }













