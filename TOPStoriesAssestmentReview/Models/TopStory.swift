//
//  TopStory.swift
//  TOPStoriesAssestmentReview
//
//  Created by Melinda Diaz on 2/6/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//

import Foundation

enum ImageFormat: String {//we want an easy way to access the multimedia objects and here in the model it makes it easier to access it.This makes sure it typesSafe our code. THEN MAKE AN EXTENSION!!!!
    case superJumbo = "superJumbo" //for the detail view
    case thumbLarge = "thumbLarge"
    case standardThumbnail = "Standard Thumbnail"
    case normal = "normal"
}
struct TopStories: Codable {
    let section: String
    let lastUpdated: String
    let results: [Article]
    
    private enum CodingKeys: String, CodingKey {
        case section
        case lastUpdated = "last_updated"
        case results
    }
}


struct Article: Codable {
    let section: String
    let title: String
    let abstract: String
    let publishedDate: String
    let multimedia: [Multimedia]
    
    private enum CodingKeys: String, CodingKey {
        case section
        case title
        case abstract
        case publishedDate = "published_date"
        case multimedia
    }
    
}

struct Multimedia: Codable {
    let url: String
    let format: String //superJumbo and ThumbLarge
    let height: Double
    let width: Double
    let caption: String
}
//we use this on the instance of article itself
extension Article {//article.getArticleImageURL(.superJumbo)
    //we created anenum so that the user does not just put anything in the search and the enum makes the claims that those are the only valid types
    func getArticleIMageURL(for imageFormat: ImageFormat) -> String {
        //in  an article we have access to the array of multimedia images so we want to filter the media that the user is looking for. is that $0.format is equal to what the user wants and it could be more than one. $0 is the first instance of multimedia
        let results = multimedia.filter{$0.format == imageFormat.rawValue} //"thumbLarge" == "thumbLarge"
        //the result should get you an image and i grab the first one and return the URL of that image. SO whatever we get back here needs to be a URL
        guard let multimediaImage = results.first else {
            //results is 0
            return "" //then you can do whatever you want with that default image or nil
        }
        return multimediaImage.url
    }
}
