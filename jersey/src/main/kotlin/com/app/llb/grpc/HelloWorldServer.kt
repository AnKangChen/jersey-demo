package com.app.llb.grpc

import io.grpc.Server
import io.grpc.ServerBuilder
import org.slf4j.LoggerFactory

class HelloWorldServer{
    private  var logger = LoggerFactory.getLogger(HelloWorldServer::class.java)

    private var port : Int = 9999

    //private var server : Server

    @Throws(Exception::class)
    fun start(){
       //   server = ServerBuilder.forPort(port).addService(GreetGrpc)

    }

}
class data{
    companion object {
        private var l1 = 0
    }
    var list = arrayListOf<Int>(1,2,3)

    fun test(){
        //list.forEach(println())
        data().apply { l1 = 5 }
        println(l1)
    }
}
fun main(args:Array<String>){
    data().test()
}