//
//  ModelCountry.swift
//  TravelWise
//
//  Created by apple on 27.07.2023.
//

import Foundation
struct CountryResponse: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String
    let ccn3: String?
    let cca3: String
    let cioc: String?
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: Currencies?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: Region
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: Demonyms?
    let flag: String
    let maps: Maps
    let population: Int
    let fifa: String?
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags: Flags
    let coatOfArms: CoatOfArms
    let startOfWeek: StartOfWeek
    let capitalInfo: CapitalInfo
    let borders: [String]?
    let gini: [String: Double]?
    let postalCode: PostalCode?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let usd, pen, top, eur: Aed?
    let pab, mga, xaf, huf: Aed?
    let mnt, sar, szl, zar: Aed?
    let ugx, pyg, xof, mur: Aed?
    let ckd, nzd, npr, scr: Aed?
    let aed, byn, dop, lyd: Aed?
    let php, all, idr, thb: Aed?
    let kes, lrd, inr, bhd: Aed?
    let mwk, isk, bnd, sgd: Aed?
    let wst, gel, pgk, ghs: Aed?
    let afn, crc, fjd, krw: Aed?
    let twd, czk, nio, clp: Aed?
    let gmd, bzd, mvr, vuv: Aed?
    let myr, xcd, irr, rub: Aed?
    let aud, kid, bdt, amd: Aed?
    let mxn, omr, chf, bsd: Aed?
    let tvd, dkk, fok, kyd: Aed?
    let egp, azn, gbp, imp: Aed?
    let bbd, gtq, jpy, vnd: Aed?
    let hkd, aoa, mzn, bwp: Aed?
    let syp, mdl, ggp, xpf: Aed?
    let pln, ttd, kzt, awg: Aed?
    let srd, bmd, mru, sll: Aed?
    let gnf, pkr, lsl, tjs: Aed?
    let ern, jep, khr, ang: Aed?
    let uyu, dzd, mad, cve: Aed?
    let mop, gyd, nok, ssp: Aed?
    let lbp, kwd, shp, mmk: Aed?
    let ils, tmt, ves, tnd: Aed?
    let currenciesTRY, cop, kmf, sbd: Aed?
    let uzs, jod, cuc, cup: Aed?
    let kgs, sek, cdf, gip: Aed?
    let sos, lkr, lak, yer: Aed?
    let fkp, zmw, rsd, stn: Aed?
    let djf, bgn, ars, ngn: Aed?
    let rwf, cad, kpw, mkd: Aed?
    let zwl, cny, etb, bif: Aed?
    let uah, tzs, qar, brl: Aed?
    let sdg: BAM?
    let ron, iqd, btn, hnl: Aed?
    let nad, htg: Aed?
    let bam: BAM?
    let jmd, bob: Aed?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case pen = "PEN"
        case top = "TOP"
        case eur = "EUR"
        case pab = "PAB"
        case mga = "MGA"
        case xaf = "XAF"
        case huf = "HUF"
        case mnt = "MNT"
        case sar = "SAR"
        case szl = "SZL"
        case zar = "ZAR"
        case ugx = "UGX"
        case pyg = "PYG"
        case xof = "XOF"
        case mur = "MUR"
        case ckd = "CKD"
        case nzd = "NZD"
        case npr = "NPR"
        case scr = "SCR"
        case aed = "AED"
        case byn = "BYN"
        case dop = "DOP"
        case lyd = "LYD"
        case php = "PHP"
        case all = "ALL"
        case idr = "IDR"
        case thb = "THB"
        case kes = "KES"
        case lrd = "LRD"
        case inr = "INR"
        case bhd = "BHD"
        case mwk = "MWK"
        case isk = "ISK"
        case bnd = "BND"
        case sgd = "SGD"
        case wst = "WST"
        case gel = "GEL"
        case pgk = "PGK"
        case ghs = "GHS"
        case afn = "AFN"
        case crc = "CRC"
        case fjd = "FJD"
        case krw = "KRW"
        case twd = "TWD"
        case czk = "CZK"
        case nio = "NIO"
        case clp = "CLP"
        case gmd = "GMD"
        case bzd = "BZD"
        case mvr = "MVR"
        case vuv = "VUV"
        case myr = "MYR"
        case xcd = "XCD"
        case irr = "IRR"
        case rub = "RUB"
        case aud = "AUD"
        case kid = "KID"
        case bdt = "BDT"
        case amd = "AMD"
        case mxn = "MXN"
        case omr = "OMR"
        case chf = "CHF"
        case bsd = "BSD"
        case tvd = "TVD"
        case dkk = "DKK"
        case fok = "FOK"
        case kyd = "KYD"
        case egp = "EGP"
        case azn = "AZN"
        case gbp = "GBP"
        case imp = "IMP"
        case bbd = "BBD"
        case gtq = "GTQ"
        case jpy = "JPY"
        case vnd = "VND"
        case hkd = "HKD"
        case aoa = "AOA"
        case mzn = "MZN"
        case bwp = "BWP"
        case syp = "SYP"
        case mdl = "MDL"
        case ggp = "GGP"
        case xpf = "XPF"
        case pln = "PLN"
        case ttd = "TTD"
        case kzt = "KZT"
        case awg = "AWG"
        case srd = "SRD"
        case bmd = "BMD"
        case mru = "MRU"
        case sll = "SLL"
        case gnf = "GNF"
        case pkr = "PKR"
        case lsl = "LSL"
        case tjs = "TJS"
        case ern = "ERN"
        case jep = "JEP"
        case khr = "KHR"
        case ang = "ANG"
        case uyu = "UYU"
        case dzd = "DZD"
        case mad = "MAD"
        case cve = "CVE"
        case mop = "MOP"
        case gyd = "GYD"
        case nok = "NOK"
        case ssp = "SSP"
        case lbp = "LBP"
        case kwd = "KWD"
        case shp = "SHP"
        case mmk = "MMK"
        case ils = "ILS"
        case tmt = "TMT"
        case ves = "VES"
        case tnd = "TND"
        case currenciesTRY = "TRY"
        case cop = "COP"
        case kmf = "KMF"
        case sbd = "SBD"
        case uzs = "UZS"
        case jod = "JOD"
        case cuc = "CUC"
        case cup = "CUP"
        case kgs = "KGS"
        case sek = "SEK"
        case cdf = "CDF"
        case gip = "GIP"
        case sos = "SOS"
        case lkr = "LKR"
        case lak = "LAK"
        case yer = "YER"
        case fkp = "FKP"
        case zmw = "ZMW"
        case rsd = "RSD"
        case stn = "STN"
        case djf = "DJF"
        case bgn = "BGN"
        case ars = "ARS"
        case ngn = "NGN"
        case rwf = "RWF"
        case cad = "CAD"
        case kpw = "KPW"
        case mkd = "MKD"
        case zwl = "ZWL"
        case cny = "CNY"
        case etb = "ETB"
        case bif = "BIF"
        case uah = "UAH"
        case tzs = "TZS"
        case qar = "QAR"
        case brl = "BRL"
        case sdg = "SDG"
        case ron = "RON"
        case iqd = "IQD"
        case btn = "BTN"
        case hnl = "HNL"
        case nad = "NAD"
        case htg = "HTG"
        case bam = "BAM"
        case jmd = "JMD"
        case bob = "BOB"
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String
}

// MARK: - BAM
struct BAM: Codable {
    let name: String
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String
}

// MARK: - Flags
struct Flags: Codable {
    let png: String
    let svg: String
    let alt: String?
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format: String
    let regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case saturday = "saturday"
    case sunday = "sunday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}
