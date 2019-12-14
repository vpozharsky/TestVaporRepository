import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    router.get { req -> Future<View> in
        
        return Cupcake.query(on: req).all().flatMap(to: View.self) {
            cupcakes in
            return try req.view().render("home", ["cupcakes": cupcakes])

        }
        
    }
    
    router.post(Cupcake.self, at: "add") { req, cupcake -> Future<Response> in
        return cupcake.save(on: req).map(to: Response.self) {
            cupcake in
            return req.redirect(to: "/")
        }
    }
}
