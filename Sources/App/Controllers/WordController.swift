import Fluent
import Vapor

struct WordController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let words = routes.grouped("word")
        words.get(use: index)
        words.post(use: create)
        words.group(":wordID") { word in
            word.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Word]> {
        return Word.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Word> {
        let word = try req.content.decode(Word.self)
        return word.save(on: req.db).map { word }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Word.find(req.parameters.get("wordID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
