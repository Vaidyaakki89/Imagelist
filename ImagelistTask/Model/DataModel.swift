//
//  DataModel.swift
//  ImagelistTask
//
//  Created by AKSHAY VAIDYA on 14/04/24.
//



import Foundation

// MARK: - DataModelElement

//struct DataModel:Codable{
//    
//    let element:[DataModelElement]?
//}

struct DataModelElement: Codable {
    let id, title: String?
    let language: String?
    let thumbnail: Thumbnail?
    let mediaType: Int?
    let coverageURL: String?
    let publishedAt, publishedBy: String?
    let backupDetails: BackupDetails?
}

// MARK: - BackupDetails
struct BackupDetails: Codable {
    let pdfLink: String?
    let screenshotURL: String?
}



// MARK: - Thumbnail
struct Thumbnail: Codable {
    let id: String?
    let version: Int?
    let domain: String?
    let basePath: String?
    let key: String?
    let qualities: [Int]?
    let aspectRatio: Double?
}

typealias DataModel = [DataModelElement]?


