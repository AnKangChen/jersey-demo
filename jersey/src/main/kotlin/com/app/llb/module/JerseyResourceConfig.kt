package com.app.llb.module

import org.glassfish.jersey.server.ResourceConfig

abstract class JerseyResourceConfig : ResourceConfig(){
    init {
        configuration()
    }
    abstract fun configuration()

}