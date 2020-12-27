//
//  HTTPError.swift
//  iOSTestProject-C
//
//  Created by Ali Bahadori on 26.12.20.
//

import Foundation

enum HTTPError: Error {
    case invalidResponse, noData, failedRequest, invalidData
}
