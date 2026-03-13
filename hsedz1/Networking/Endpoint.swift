//
//  Endpoint.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 13.03.2026.
//

enum Endpoint {
    case ip
    case geo
    case geoByIp(ip: String)

    var path: String {
        switch self {
        case .ip:
            "/ip"
        case .geo:
            "/geo"
        case let .geoByIp(ip):
            "/\(ip)/geo"
        }
    }

    var method: String {
        switch self {
        case .ip, .geo, .geoByIp:
            "GET"
        }
    }
}
