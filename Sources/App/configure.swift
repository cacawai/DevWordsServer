import Fluent
import FluentSQLiteDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
//    app.databases.use(.sqlite(.memory), as: .sqlite)
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateWord())
    // 2
    app.logger.logLevel = .debug

    // 3
    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
}
