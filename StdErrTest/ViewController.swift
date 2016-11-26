//
//  ViewController.swift
//  StdErrTest
//
//  Created by Mark Briggs on 11/25/16.
//  Copyright © 2016 Mark Briggs. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var outputTV: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func runProcessClicked(_ sender: NSButton) {
        // Make sure we can find the script file. Return if not.
        guard let path = Bundle.main.path(forResource: "myScript", ofType:".sh") else {
            print("\n  Unable to locate: myScript.sh!")
            return
        }
        
        // Init outputPipe
        let outputPipe = Pipe()
        
        // Setup & Launch our process
        let ps: Process = Process()
        ps.launchPath = path
        //ps.arguments = arguments
        ps.standardOutput = outputPipe
        ps.launch()
        ps.waitUntilExit()
        
        // Read everything the outputPipe captured from stdout
        let data = outputPipe.fileHandleForReading.readDataToEndOfFile()
        var outputString = String(data: data, encoding: String.Encoding.utf8) ?? ""
        outputString = outputString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Return the output
        outputTV.string = "[output: \(outputString)]"
        print("[output: \(outputString)]")
    }
}

