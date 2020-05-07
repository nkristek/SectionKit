import Foundation
import SectionKit
import DifferenceKit

/// A `SectionController` that calculates the differences for animated changes to the items in the section.
open class DiffingListSectionController<Model, Item>: ListSectionController<Model, Item>
    where Item: Differentiable
{
    override open func calculateUpdate(from oldData: [Item],
                                       to newData: [Item]) -> SectionUpdate<[Item]> {
        let changeSet = StagedChangeset(source: oldData, target: newData)
        return SectionUpdate(sectionController: self,
                             batchOperations: changeSet.map(\.sectionBatchOperation),
                             setData: { [weak self] in self?.collectionViewItems = $0 },
                             shouldReloadSection: { $0.changes.count > 100 })
    }
}

