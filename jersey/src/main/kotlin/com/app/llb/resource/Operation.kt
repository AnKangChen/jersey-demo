package com.app.llb.resource

import com.google.inject.Inject
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import javax.ws.rs.GET
import javax.ws.rs.Path

@Path("/op")
@Api(value = "/pet", description = "Operation")
open class Operation {


    @Inject
    private lateinit var a: A

    @GET
    @Path("/xy")
    @ApiOperation("WHAT IS OPERATION")
    fun get(): String {
        a.test()
        println("Hello KOTLIN")
        return "hello xy"
    }
}
