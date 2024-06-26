import XCTest
@testable import MinecraftNBT

final class StructureTests : XCTestCase {
    
    func testDeleteValue(){
        var nbt = NBTStructure()
        
        let key = ["key1","key2"]
        
        try! nbt.write(NBTCompound(), to: ["key1"])
        try! nbt.write("SomeValue", to: ["key1","key2"])
        
        XCTAssertEqual(try! nbt.read(["key1","key2"]) as! String, "SomeValue")
        
        try! nbt.write(nil, to: key)
        
        XCTAssertNil(try! nbt.read(key))
    }
}
