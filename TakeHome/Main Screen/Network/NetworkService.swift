//  NetworkService.swift
//  TakeHome

//  Created by George Garcia on 3/16/19.
//  Copyright © 2019 ZipRealty. All rights reserved.

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService {
    
    // MARK: - Properties
    static let shared = NetworkService()
    let jsonURL       = "http://jsonplaceholder.typicode.com/photos"
    
    // MARK: Public Functions
    func fetchData(with url: URL, success: @escaping (_ data: [Info]) -> Void, failure: @escaping(_ error: Error) -> Void) {
        fetchDataFromUrl(url: jsonURL, success: success, failure: failure)
    }
    
    // MARK: Private Functions
    private func fetchDataFromUrl(url: String, success: @escaping (_ data: [Info]) -> Void, failure: @escaping(_ error: Error) -> Void) {
    
        guard let api = URL(string: url) else { return }
        
        Alamofire.request(api, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            if response.result.isSuccess {
                
                let json    = JSON(response.result.value!)
                let rawData = json.arrayValue
                let model   = rawData.map({ return Info(rawData: $0) })
                //print(json)

                success(model)
            } else {
                if let error = response.error {
                    failure(error)
                }
            }
        }
    }
}

// MARK: - Notes/Comments

/*
 1) Experimenting on fetching data using NSURLSession (below)
 
 func jsonParser() {
 
    guard let url = URL(string: jsonURL) else { print("Couldn't create the URL...")
       return }
 
     let request = URLRequest(url: url)
 
     // Setting up the session
        let configuration = URLSessionConfiguration.default
        let session       = URLSession(configuration: configuration)
 
     // creating a request
        let dataTask = session.dataTask(with: request) { (data, response, error) in
 
    // First we should check the errors
        guard error == nil else {
            print("GET Call Error!! For: /photos...")
            print(error!)
        return
       }
 
     // Then we should also check if we actually GOT the data
        guard let responseData = data else {
            print("Error! Did not received any data...")
        return
     }
 
    // JSON Parsing!
       do {
            guard let photos = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
              print("JSON Conversion didn't work...")
            return
            }
 
             // printing out the JSON Data
             print("The Data from jsonplaceholder: \(photos.description)")
 
            // We just want to get the thumbnailurl and title
            guard let thumbnailUrl = photos["thumbnailurl"] as? String else {
                print("Couldn't get the thumbnailurl from URL...")
            return
         }
            print("ThumbnailUrl: \(thumbnailUrl)")
 
            guard let title = photos["title"] as? String else {
                print("Couldn't get the title from URL..")
            return
           }
 
         print("Title: \(title)")
 
         } catch {
                print("JSON Data Conversion error!")
                return
             }
            }
            dataTask.resume()
         }
*/
