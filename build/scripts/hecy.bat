@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  hecy startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and HECY_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\hecy-1.0-SNAPSHOT.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.2.41.jar;%APP_HOME%\lib\sentry-logback-1.0.0.jar;%APP_HOME%\lib\logback-classic-1.2.1.jar;%APP_HOME%\lib\poi-ooxml-3.14.jar;%APP_HOME%\lib\poi-3.14.jar;%APP_HOME%\lib\freemarker-2.3.28.jar;%APP_HOME%\lib\jersey-container-jetty-servlet-2.19.jar;%APP_HOME%\lib\jersey-container-servlet-2.19.jar;%APP_HOME%\lib\jersey-container-jetty-http-2.19.jar;%APP_HOME%\lib\jersey2-guice-0.10.jar;%APP_HOME%\lib\jersey-container-servlet-core-2.19.jar;%APP_HOME%\lib\jersey-server-2.19.jar;%APP_HOME%\lib\jersey-client-2.19.jar;%APP_HOME%\lib\guice-servlet-4.0.jar;%APP_HOME%\lib\guice-assistedinject-4.0.jar;%APP_HOME%\lib\guice-multibindings-4.0.jar;%APP_HOME%\lib\guice-4.0.jar;%APP_HOME%\lib\jackson-databind-2.9.5.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.2.41.jar;%APP_HOME%\lib\kotlin-stdlib-1.2.41.jar;%APP_HOME%\lib\logback-core-1.2.1.jar;%APP_HOME%\lib\sentry-1.0.0.jar;%APP_HOME%\lib\slf4j-api-1.7.24.jar;%APP_HOME%\lib\commons-codec-1.10.jar;%APP_HOME%\lib\poi-ooxml-schemas-3.14.jar;%APP_HOME%\lib\curvesapi-1.03.jar;%APP_HOME%\lib\jersey-media-jaxb-2.19.jar;%APP_HOME%\lib\jersey-common-2.19.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.1.jar;%APP_HOME%\lib\hk2-locator-2.4.0-b25.jar;%APP_HOME%\lib\hk2-api-2.4.0-b25.jar;%APP_HOME%\lib\javax.inject-2.4.0-b25.jar;%APP_HOME%\lib\jsr305-3.0.0.jar;%APP_HOME%\lib\hk2-utils-2.4.0-b25.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\guava-16.0.1.jar;%APP_HOME%\lib\jetty-webapp-9.1.1.v20140108.jar;%APP_HOME%\lib\jackson-annotations-2.9.0.jar;%APP_HOME%\lib\jackson-core-2.9.5.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\xmlbeans-2.6.0.jar;%APP_HOME%\lib\javax.annotation-api-1.2.jar;%APP_HOME%\lib\jersey-guava-2.19.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.1.jar;%APP_HOME%\lib\aopalliance-repackaged-2.4.0-b25.jar;%APP_HOME%\lib\javassist-3.18.1-GA.jar;%APP_HOME%\lib\jetty-servlet-9.1.1.v20140108.jar;%APP_HOME%\lib\jetty-security-9.1.1.v20140108.jar;%APP_HOME%\lib\jetty-server-9.1.1.v20140108.jar;%APP_HOME%\lib\jetty-xml-9.1.1.v20140108.jar;%APP_HOME%\lib\jetty-http-9.1.1.v20140108.jar;%APP_HOME%\lib\jetty-io-9.1.1.v20140108.jar;%APP_HOME%\lib\jetty-util-9.1.1.v20140108.jar;%APP_HOME%\lib\jetty-continuation-9.1.1.v20140108.jar;%APP_HOME%\lib\stax-api-1.0.1.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\validation-api-1.1.0.Final.jar

@rem Execute hecy
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %HECY_OPTS%  -classpath "%CLASSPATH%" com.llb.service.jersey.JerseyServer %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable HECY_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%HECY_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
