//
//  PersistenceController.swift
//  ExchangeRate
//
//  Created by Alonso Rodriguez on 20/02/22.
//

import Foundation
import CoreData
import Combine
struct PersistenceController{
    static let shared = PersistenceController()

    let container:NSPersistentContainer

    init(inMemory : Bool = false){
        container = NSPersistentContainer(name: "EXCHANGE_RATE")
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError()
            }
        }
    }
}


class ResultsListStorage : NSObject, ObservableObject{
    var results = CurrentValueSubject<[ResultList], Never>([])
    private let  resultFetchController : NSFetchedResultsController<ResultList>
    static let shared = ResultsListStorage()
    
   private override init() {
        resultFetchController = NSFetchedResultsController(
            fetchRequest: ResultList.fetchRequest(),
            managedObjectContext: PersistenceController.shared.container.viewContext,
            sectionNameKeyPath: nil,
        cacheName: nil)
       super.init()
       
       resultFetchController.delegate = self
       do{
           try resultFetchController.performFetch()
           results.value = resultFetchController.fetchedObjects ?? []
       }
       catch{
           NSLog("Error")
       }
       
    }
    
    func add(data : ResultList){
        let newEntity = ResultList(context: PersistenceController.shared.container.viewContext)
        newEntity.id = data.id
        newEntity.amountSent = data.amountSent
        newEntity.amountReceived = data.amountReceived
        do {
            try PersistenceController.shared.container.viewContext.save()
               
        } catch let error {
            print("Error: \(error)")
        }
    }
}


extension ResultsListStorage : NSFetchedResultsControllerDelegate{
    public func controllerDidChangeContent(_ controller : NSFetchedResultsController<NSFetchRequestResult>){
        guard let results = controller.fetchedObjects as? [ResultList] else {return}
        self.results.value = results
    }
}
