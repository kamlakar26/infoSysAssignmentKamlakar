//
//  DataTableviewCellTests.swift
//  infoSysAssignmentKamlakarTests
//
//  Created by ideaqu1 on 22/06/20.
//  Copyright © 2020 kamlakar. All rights reserved.
//

import XCTest
@testable import infoSysAssignmentKamlakar

class DataTableviewCellTests: XCTestCase {
    // MARK: - Properties
    var profileImageView: UIImageView!
    var tempImageUrl: String = "https://i49.photobucket.com/albums/f260/starfoxfan/fursona.jpg"

    // MARK: - Test Cases Life Cycle
    override func setUp() {
        profileImageView = UIImageView()
    }

    override func tearDown() {
         super.tearDown()
    }

    // MARK: - Table cell profile image test cases
    func testSetImageWithValidUrl() {
        XCTAssertNotNil(tempImageUrl)
        let imageURL = URL(string: tempImageUrl)
        XCTAssertNotNil(imageURL)
        let placeholderImage = UIImage(named: "defaultthumb.png")
        XCTAssertNotNil(placeholderImage)
        self.profileImageView.af.setImage(withURL: imageURL!, placeholderImage: placeholderImage)
        XCTAssertNotNil(self.profileImageView.image)
    }

    func testSetImageWithInvalidUrl() {
        let invalidUrl = "https://testinvalidurl"
        XCTAssertNotNil(invalidUrl)
        let imageURL = URL(string: invalidUrl)
        XCTAssertNotNil(imageURL)
        let placeholderImage = UIImage(named: "defaultthumb.png")
        XCTAssertNotNil(placeholderImage)
        self.profileImageView.af.setImage(withURL: imageURL!, placeholderImage: placeholderImage)
        XCTAssertNotNil(self.profileImageView.image)
    }
}
