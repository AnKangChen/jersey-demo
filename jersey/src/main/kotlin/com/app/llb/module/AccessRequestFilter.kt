package com.app.llb.module

import com.google.inject.Inject
import javax.servlet.http.HttpServletRequest
import javax.ws.rs.container.ContainerRequestContext
import javax.ws.rs.container.ContainerRequestFilter
import javax.ws.rs.ext.Provider

@Provider
class AccessRequestFilter : ContainerRequestFilter {

    @Inject
    private lateinit var servletRequestProvider : com.google.inject.Provider<HttpServletRequest>

    override fun filter(requestContext: ContainerRequestContext?) {
        servletRequestProvider.get()
    }

}