import XCTest
@testable import MinecraftNBT
@testable import DataTools

final class DataStreamTests: XCTestCase {
	func testReadPayload() {
		let bytes: [UInt8] = [
			0x3F,                                           // byte
			0x46, 0x29,                                     // short
			0x0C, 0x77, 0x1D, 0x5E,                         // int
			0x07, 0x27, 0x4D, 0xAA, 0xD8, 0x84, 0xB9, 0x26, // long
			0x4b, 0x09, 0x84, 0xa0,                         // float
			0x43, 0x71, 0xF7, 0x5D, 0x93, 0x7F, 0x51, 0xE9, // double
			0x00, 0x05, 0x48, 0x65, 0x6C, 0x6C, 0x6F,       // string
			0x05, 0x00, 0x00, 0x00, 0x00,                   // empty generic list of floats
			0x00, 0x00, 0x00, 0x00,                         // empty generic list of bytes
			0x00, 0x00, 0x00, 0x00,                         // empty generic list of ints
			0x00, 0x00, 0x00, 0x00,                         // empty generic list of longs
			0x00,                                           // empty compound
			0x00,                                           // end tag
		]
		let stream = DataStream(bytes)
	
		XCTAssertTrue(equal(stream.readPayload(type: .byte), ByteValue(value: 0x3F)))
		XCTAssertTrue(equal(stream.readPayload(type: .short), ShortValue(value: 0x4629)))
		XCTAssertTrue(equal(stream.readPayload(type: .int), IntValue(value: 0x0C771D5E)))
		XCTAssertTrue(equal(stream.readPayload(type: .long), LongValue(value: 0x07274DAAD884B926)))
		XCTAssertTrue(equal(stream.readPayload(type: .float), FloatValue(value: 9012384.0)))
		XCTAssertTrue(equal(stream.readPayload(type: .double), DoubleValue(value: 80912894123122320)))
		XCTAssertTrue(equal(stream.readPayload(type: .string), StringValue(value: "Hello")))
		XCTAssertTrue(equal(stream.readPayload(type: .list), GenericList(genericType: .float, elements: [])))
		XCTAssertTrue(equal(stream.readPayload(type: .byteArray), ByteArray(elements: [])))
		XCTAssertTrue(equal(stream.readPayload(type: .intArray), IntArray(elements: [])))
		XCTAssertTrue(equal(stream.readPayload(type: .longArray), LongArray(elements: [])))
		XCTAssertTrue(equal(stream.readPayload(type: .compound), Compound(contents: [])))
		XCTAssertTrue(equal(stream.readPayload(type: .end), End()))
	}
}
