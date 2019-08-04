import Crypto
import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // public routes
    router.get { _ in  "Hello, World!" }
    // User
    try router.register(collection: UserController())
    
    // bearer / token auth protected routes
    let bearer = router.grouped(User.tokenAuthMiddleware())
    try bearer.register(collection: TodoController())
}
