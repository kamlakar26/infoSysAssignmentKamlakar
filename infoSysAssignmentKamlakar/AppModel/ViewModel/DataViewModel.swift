//
//  DataViewModel.swift
//  infoSysAssignmentKamlakar
//
//  Created by ideaqu1 on 22/06/20.
//  Copyright © 2020 kamlakar. All rights reserved.
//

import Foundation
import Reachability
import Alamofire

protocol ReachabilityProtocol: NSObjectProtocol {
    func networkConnectionDidConnected()
    func networkConnectionDidDisconnected()
}

class DataViewModel {
    // MARK: - Properties
    var dataModel: DataModel?
    let reachability = try? Reachability()
    weak var reachabilityDelegate: ReachabilityProtocol?
    var updateUI: () -> Void = { }
    var numberOfRows = 0
    var navTitle: String = ""
    var rowsArray: [Row] = []

    init() {
        loadApiData()
    }

    // MARK: - Required Methods
    func loadApiData() {
        self.getApiData(complete: { [weak self] (dataModel) in
            self?.dataModel = dataModel
            self?.preparedTableCellCount()
            self?.updateUI()
        })
    }

    private func preparedTableCellCount() {
        guard let rowcount = self.dataModel?.rows.count, rowcount > 0 else { return }
        self.numberOfRows = rowcount
        self.navTitle = self.dataModel?.title ?? ""
        self.rowsArray = self.dataModel?.rows ?? []
    }

    func getApiData(complete:@escaping (DataModel?) -> Void) {
        AF.request("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json").response { response in
            if let data = response.data {
                if let json = String(data: data, encoding: String.Encoding.isoLatin1) {
                    let jsonData = json.data(using: .utf8)!
                    let dataModel = try? JSONDecoder().decode(DataModel.self, from: jsonData)
                    complete(dataModel)
                } else {
                    complete(nil)
                }
            } else {
                complete(nil)
            }
        }
    }

    deinit {
        stopReachAabilityNotifier()
    }
}

// MARK: - Reachability Listner Methods
extension DataViewModel {
    func addReachabilityNotifier() {
        reachability?.whenReachable = { [weak self] reachability in
            self?.reachabilityDelegate?.networkConnectionDidConnected()
        }
        reachability?.whenUnreachable = {  [weak self] _ in
            self?.reachabilityDelegate?.networkConnectionDidDisconnected()
        }
        do {
            try reachability?.startNotifier()
        } catch {  }
    }

    private func stopReachAabilityNotifier() {
        reachability?.stopNotifier()
    }
}

