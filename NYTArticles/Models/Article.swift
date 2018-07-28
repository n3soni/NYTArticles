//
//  Article.swift
//
//  Created by Nitin on 28/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Article: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let url = "url"
    static let abstract = "abstract"
    static let source = "source"
    static let media = "media"
    static let geoFacet = "geo_facet"
    static let section = "section"
    static let type = "type"
    static let adxKeywords = "adx_keywords"
    static let desFacet = "des_facet"
    static let views = "views"
    static let id = "id"
    static let publishedDate = "published_date"
    static let title = "title"
    static let orgFacet = "org_facet"
    static let perFacet = "per_facet"
    static let assetId = "asset_id"
    static let byline = "byline"
  }

  // MARK: Properties
  public var url: String?
  public var abstract: String?
  public var source: String?
  public var media: [Media]?
  public var geoFacet: String?
  public var section: String?
  public var type: String?
  public var adxKeywords: String?
  public var desFacet: [String]?
  public var views: Int?
  public var id: Int?
  public var publishedDate: String?
  public var title: String?
  public var orgFacet: [String]?
  public var perFacet: [String]?
  public var assetId: Int?
  public var byline: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    url <- map[SerializationKeys.url]
    abstract <- map[SerializationKeys.abstract]
    source <- map[SerializationKeys.source]
    media <- map[SerializationKeys.media]
    geoFacet <- map[SerializationKeys.geoFacet]
    section <- map[SerializationKeys.section]
    type <- map[SerializationKeys.type]
    adxKeywords <- map[SerializationKeys.adxKeywords]
    desFacet <- map[SerializationKeys.desFacet]
    views <- map[SerializationKeys.views]
    id <- map[SerializationKeys.id]
    publishedDate <- map[SerializationKeys.publishedDate]
    title <- map[SerializationKeys.title]
    orgFacet <- map[SerializationKeys.orgFacet]
    perFacet <- map[SerializationKeys.perFacet]
    assetId <- map[SerializationKeys.assetId]
    byline <- map[SerializationKeys.byline]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = abstract { dictionary[SerializationKeys.abstract] = value }
    if let value = source { dictionary[SerializationKeys.source] = value }
    if let value = media { dictionary[SerializationKeys.media] = value.map { $0.dictionaryRepresentation() } }
    if let value = geoFacet { dictionary[SerializationKeys.geoFacet] = value }
    if let value = section { dictionary[SerializationKeys.section] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = adxKeywords { dictionary[SerializationKeys.adxKeywords] = value }
    if let value = desFacet { dictionary[SerializationKeys.desFacet] = value }
    if let value = views { dictionary[SerializationKeys.views] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = publishedDate { dictionary[SerializationKeys.publishedDate] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = orgFacet { dictionary[SerializationKeys.orgFacet] = value }
    if let value = perFacet { dictionary[SerializationKeys.perFacet] = value }
    if let value = assetId { dictionary[SerializationKeys.assetId] = value }
    if let value = byline { dictionary[SerializationKeys.byline] = value }
    return dictionary
  }

}
