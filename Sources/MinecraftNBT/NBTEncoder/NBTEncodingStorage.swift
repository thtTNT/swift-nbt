//
//  File.swift
//  
//
//  Created by Ezekiel Elin on 1/24/23.
//

import Foundation

class _NBTEncodingStorage {
	private(set) var nbt: NBTStructure = NBTStructure()
	
	func encodeNil(forKey key: [CodingKey]) throws {
		throw EncodingError.forbiddenType("nil cannot be encoded to NBT")
	}
	
	func encode(_ value: Bool, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(ByteValue(value: value ? 1 : 0), to: key)
	}
	
	func encode(_ value: String, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(StringValue(value: value), to: key)
	}
	
	func encode(_ value: Double, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(DoubleValue(value: value), to: key)
	}
	
	func encode(_ value: Float, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(FloatValue(value: value), to: key)
	}
	
	func encode(_ value: Int, forKey key: [CodingKey]) throws {
		try self.encode(Int64(value), forKey: key)
	}
	
	func encode(_ value: Int8, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(ByteValue(value: value), to: key)
	}
	
	func encode(_ value: Int16, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(ShortValue(value: value), to: key)
	}
	
	func encode(_ value: Int32, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(IntValue(value: value), to: key)
	}
	
	func encode(_ value: Int64, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(LongValue(value: value), to: key)
	}
	
	func encode(_ value: UInt, forKey key: [CodingKey]) throws {
		try self.encode(UInt64(value), forKey: key)
	}
	
	func encode(_ value: UInt8, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(ShortValue(value: Int16(value)), to: key)
	}
	
	func encode(_ value: UInt16, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(IntValue(value: Int32(value)), to: key)
	}
	
	func encode(_ value: UInt32, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		try nbt.write(LongValue(value: Int64(value)), to: key)
	}
	
	func encode(_ value: UInt64, forKey key: [CodingKey]) throws {
		let key = key.map { $0.stringValue }
		if 0...UInt64(Int64.max) ~= value {
			try nbt.write(LongValue(value: Int64(value)), to: key)
		} else {
			print("Warning: Storing UInt value `\(value)` as `float64`")
			try nbt.write(DoubleValue(value: Double(value)), to: key)
		}
	}
}
