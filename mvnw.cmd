@ECHO OFF
SETLOCAL
SET MAVEN_PROJECTBASEDIR=%~dp0
SET WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper.jar"
SET WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain
IF NOT EXIST %WRAPPER_JAR% (
  powershell -Command "New-Item -ItemType Directory -Force -Path '%MAVEN_PROJECTBASEDIR%.mvn\wrapper' | Out-Null; Invoke-WebRequest -UseBasicParsing -Uri 'https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.3.2/maven-wrapper-3.3.2.jar' -OutFile '%MAVEN_PROJECTBASEDIR%.mvn\wrapper\maven-wrapper.jar'"
)
"%JAVA_HOME%\bin\java.exe" -jar %WRAPPER_JAR% %* 2>NUL
IF ERRORLEVEL 1 java -classpath %WRAPPER_JAR% %WRAPPER_LAUNCHER% %*
ENDLOCAL
