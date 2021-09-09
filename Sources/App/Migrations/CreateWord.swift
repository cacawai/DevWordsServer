import Fluent

struct CreateWord: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("Words")
            .id()
            .field("english", .string, .required)
            .field("phonetic", .string, .required)
            .field("chinese", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("Words").delete()
    }
}
