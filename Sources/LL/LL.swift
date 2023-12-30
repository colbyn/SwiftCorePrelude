//
//  LL.swift
//  
//
//  Created by Colbyn Wadman on 10/20/23.
//

import Foundation

#if os(iOS)
#elseif os(macOS)
#endif

#if os(macOS)
#endif

#if os(iOS)
import UIKit
import protocol SwiftUI.UIViewRepresentable
import protocol SwiftUI.UIViewControllerRepresentable
import class    SwiftUI.UIHostingController
#elseif os(macOS)
import AppKit
import protocol SwiftUI.NSViewRepresentable
import protocol SwiftUI.NSViewControllerRepresentable
import class    SwiftUI.NSHostingController
#endif

public struct LL {}

#if os(iOS)
extension LL {
    public typealias ViewRepresentable = SwiftUI.UIViewRepresentable
    public typealias ViewControllerRepresentable = SwiftUI.UIViewControllerRepresentable
    public typealias HostingController = SwiftUI.UIHostingController
    public typealias View = UIView
    public typealias StackView = UIStackView
    public typealias TextView = UITextView
    public typealias TextViewDelegate = UITextViewDelegate
    public typealias ViewController = UIViewController
    public typealias ScrollView = UIScrollView
    public typealias Font = UIFont
    public typealias Menu = UIMenu
    public typealias Image = UIImage
    public typealias GestureRecognizer = UIGestureRecognizer
}
#elseif os(macOS)
extension LL {
    public typealias ViewRepresentable = SwiftUI.NSViewRepresentable
    public typealias ViewControllerRepresentable = SwiftUI.NSViewControllerRepresentable
    public typealias HostingController = SwiftUI.NSHostingController
    public typealias View = NSView
    public typealias StackView = NSStackView
    public typealias TextView = NSTextView
    public typealias TextViewDelegate = NSTextViewDelegate
    public typealias ViewController = NSViewController
    public typealias ScrollView = NSScrollView
    public typealias Font = NSFont
    public typealias Menu = NSMenu
    public typealias Image = NSImage
    public typealias GestureRecognizer = NSGestureRecognizer
}
#endif

