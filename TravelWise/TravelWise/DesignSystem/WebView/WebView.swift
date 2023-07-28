//
//  WebView.swift
//  TravelWise
//
//  Created by apple on 28.07.2023.
//

import WebKit
final class WebView: WKWebView {
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        // Call the designated initializer of the superclass
        super.init(frame: frame, configuration: configuration)
        
        // Additional setup if needed
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init() {
        // Use a default frame and configuration for convenience
        self.init(frame: .zero, configuration: WKWebViewConfiguration())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
