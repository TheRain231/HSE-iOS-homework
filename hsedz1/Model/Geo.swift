//
//  Geo.swift
//  hsedz1
//
//  Created by Andrey Stepanov on 13.03.2026.
//

struct Geo: Codable {
    let ip: String
    let city: String
    let region: String
    let country: String
    let loc: String
    let org: String
    let postal: String
    let timezone: String
    let readme: String

    init(ip: String = "", city: String = "", region: String = "", country: String = "", loc: String = "", org: String = "", postal: String = "", timezone: String = "", readme: String = "") {
        self.ip = ip
        self.city = city
        self.region = region
        self.country = country
        self.loc = loc
        self.org = org
        self.postal = postal
        self.timezone = timezone
        self.readme = readme
    }
}
