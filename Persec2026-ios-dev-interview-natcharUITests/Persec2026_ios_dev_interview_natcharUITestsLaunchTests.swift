//
//  Persec2026_ios_dev_interview_natcharUITestsLaunchTests.swift
//  Persec2026-ios-dev-interview-natcharUITests
//
//  Created by Natchar boonmak on 16/1/2569 BE.
//

import XCTest

final class Persec2026_ios_dev_interview_natcharUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
