//
//  NBTStructure.swift
//  DataTools
//
//  Created by Ezekiel Elin on 5/5/19.
//

import Foundation
import Gzip
import DataTools

public class NBTStructure {
    public let tag: NBTTag
    
    public init(_ url: URL) throws {
        let compressedData = try Data(contentsOf: url)
        let data = try compressedData.gunzipped()
        let stream = DataStream(data)
        
        self.tag = try makeTag(from: stream)
    }
}