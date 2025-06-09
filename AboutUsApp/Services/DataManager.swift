//
//  DataStore.swift
//  AboutUsApp
//
//  Created by Олег Зуев on 07.06.2025.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private var sites: [SiteInfo] = [
        SiteInfo(siteAdress: "www.swiftbook.org", userName: "IOSZver", password: "123qwe"),
        SiteInfo(siteAdress: "www.openai.com", userName: "UwillSmithRobot", password: "185252"),
        SiteInfo(siteAdress: "www.onlyfans.com", userName: "NakedInfluenser", password: "HardWorkPaysOf")
    ]
    
    func getAllSites() -> [SiteInfo] {
        return sites
    }
    
    func addSite(_ site: SiteInfo) {
        sites.append(site)
    }
    
    func deleteSiteWith(index: Int) {
        guard index >= 0 && index < sites.count else { return }
        sites.remove(at: index)
    }
}


