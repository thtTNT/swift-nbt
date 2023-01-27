import XCTest
@testable import DataTools

final class StringTests: XCTestCase {
	
	//MARK:- Unsigned Data
	// Unsigned data is tested by feeding in a series of bytes
	// and verifying they read out as the same value
	
	func testStringSerialization() {
		let acc = DataAccumulator()
		"Sample String Value".append(to: acc)
		XCTAssertEqual(Data([0x00, 0x13, 0x53, 0x61, 0x6D, 0x70, 0x6C, 0x65, 0x20, 0x53, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x20, 0x56, 0x61, 0x6C, 0x75, 0x65]), acc.data)
	}
	
	func testStringDeserialization() {
		let stream = DataStream([0x00, 0x13, 0x53, 0x61, 0x6D, 0x70, 0x6C, 0x65, 0x20, 0x53, 0x74, 0x72, 0x69, 0x6E, 0x67, 0x20, 0x56, 0x61, 0x6C, 0x75, 0x65])
		let read = String.make(with: stream)
		XCTAssertEqual("Sample String Value", read)
	}
}
