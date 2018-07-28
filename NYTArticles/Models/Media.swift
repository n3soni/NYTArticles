//
//  Media.swift
//
//  Created by Nitin on 28/07/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Media: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let copyright = "copyright"
    static let mediaMetadata = "media-metadata"
    static let approvedForSyndication = "approved_for_syndication"
    static let subtype = "subtype"
    static let type = "type"
    static let caption = "caption"
  }

  // MARK: Properties
  public var copyright: String?
  public var mediaMetadata: [MediaMetadata]?
  public var approvedForSyndication: Int?
  public var subtype: String?
  public var type: String?
  public var caption: String?

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
    copyright <- map[SerializationKeys.copyright]
    mediaMetadata <- map[SerializationKeys.mediaMetadata]
    approvedForSyndication <- map[SerializationKeys.approvedForSyndication]
    subtype <- map[SerializationKeys.subtype]
    type <- map[SerializationKeys.type]
    caption <- map[SerializationKeys.caption]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = copyright { dictionary[SerializationKeys.copyright] = value }
    if let value = mediaMetadata { dictionary[SerializationKeys.mediaMetadata] = value.map { $0.dictionaryRepresentation() } }
    if let value = approvedForSyndication { dictionary[SerializationKeys.approvedForSyndication] = value }
    if let value = subtype { dictionary[SerializationKeys.subtype] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = caption { dictionary[SerializationKeys.caption] = value }
    return dictionary
  }

}
