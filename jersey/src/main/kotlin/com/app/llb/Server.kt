package com.app.llb

import com.app.llb.module.JerseyResourceConfig
import com.google.inject.*
import com.google.inject.servlet.GuiceFilter
import com.google.inject.servlet.GuiceServletContextListener
import com.google.inject.servlet.ServletModule
import com.google.inject.util.Modules
import com.squarespace.jersey2.guice.JerseyGuiceModule
import com.squarespace.jersey2.guice.JerseyGuiceUtils
import org.eclipse.jetty.server.Server
import org.eclipse.jetty.server.ServerConnector
import org.eclipse.jetty.webapp.Configuration
import org.eclipse.jetty.webapp.WebAppContext
import org.eclipse.jetty.webapp.WebXmlConfiguration
import org.glassfish.jersey.jetty.JettyHttpContainerFactory
import org.glassfish.jersey.servlet.ServletContainer
import org.slf4j.LoggerFactory
import java.net.URI
import java.util.*
import javax.servlet.DispatcherType




class TemplateConfig : JerseyResourceConfig(){
    override fun configuration() {
        packages("com.app.llb.resource")
        register(io.swagger.jaxrs.listing.ApiListingResource::class.java)
        register(io.swagger.jaxrs.listing.SwaggerSerializers::class.java)
    }
}
class SimpleGuiceServletContextListener(stage: Stage,module: Module) : GuiceServletContextListener(){
    private val _injector: Injector = Guice.createInjector(stage, Modules.combine(module))

    init{
        JerseyGuiceUtils.install(_injector)
    }

    override fun getInjector(): Injector {
        return _injector
    }
}

class DefaultServletModule(val resourceConfig: JerseyResourceConfig): ServletModule(){
    override fun configureServlets() {
        val container = ServletContainer(resourceConfig)
        serve("/*").with(container)
    }
}
class JerseyServer(resourceConfig: JerseyResourceConfig, stage: Stage, modules: Iterable<Module>){
    private val logger = LoggerFactory.getLogger(JerseyServer::class.java)
    private var server: Server
    private var host: String = "0.0.0."
    private var port: Int = 8888
    private var config: SimpleGuiceServletContextListener
    init{
        val mods = modules.toMutableList()
        mods.add(JerseyGuiceModule("test_server"))
        if(modules.none { it is ServletModule }){
            mods.add(DefaultServletModule(resourceConfig))
        }
        val url = URI.create("http://$host:$port/")
        config = SimpleGuiceServletContextListener(stage, Modules.combine(mods))
        server = create(url, null)
    }
    constructor(resourceConfig: JerseyResourceConfig, vararg modules: Module)
            : this(resourceConfig,Stage.DEVELOPMENT, modules.asIterable())


    private fun create(url: URI, contextInitParams: Map<String, String>?): Server{
        val context = WebAppContext()
        context.displayName = "JettyServer"
        context.configurations = arrayOf<Configuration>(WebXmlConfiguration())
        context.addEventListener(config)
        context.addFilter(GuiceFilter::class.java,"/*", EnumSet.of(DispatcherType.REQUEST))
        if (contextInitParams != null) {
            for ((key, value) in contextInitParams) {
                context.setInitParameter(key, value)
                println("key  value $key$value")
            }
        }

        val server = JettyHttpContainerFactory.createServer(url, false)
        server.handler = context
        return server
    }

    private fun setPort(port: Int){
        (server.connectors.first { it is ServerConnector } as ServerConnector).port = port

    }
    fun start(port: Int){
        try{
            setPort(port)
            server.start()
        }catch (e:Exception){
            e.printStackTrace()
        }
    }
}
class ApplicationModule: AbstractModule(){
    override fun configure() {

    }
}
fun main(args:Array<String>){
    JerseyServer(TemplateConfig(), ApplicationModule()).start(8002)

}