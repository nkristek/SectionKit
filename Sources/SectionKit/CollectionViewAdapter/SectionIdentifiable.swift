import Foundation

/// Defines a hashable id for a section.
public protocol SectionIdentifiable {
    /// An identifier that uniquely identifies a section.
    var sectionId: AnyHashable { get }
}

@available(OSX 10.15, iOS 13, tvOS 13, watchOS 6, *)
public extension SectionIdentifiable where Self: Identifiable {
    @inlinable
    var sectionId: AnyHashable { id }
}
