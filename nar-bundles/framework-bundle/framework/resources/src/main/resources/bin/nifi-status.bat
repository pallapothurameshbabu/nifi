rem
rem    Licensed to the Apache Software Foundation (ASF) under one or more
rem    contributor license agreements.  See the NOTICE file distributed with
rem    this work for additional information regarding copyright ownership.
rem    The ASF licenses this file to You under the Apache License, Version 2.0
rem    (the "License"); you may not use this file except in compliance with
rem    the License.  You may obtain a copy of the License at
rem
rem       http://www.apache.org/licenses/LICENSE-2.0
rem
rem    Unless required by applicable law or agreed to in writing, software
rem    distributed under the License is distributed on an "AS IS" BASIS,
rem    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem    See the License for the specific language governing permissions and
rem    limitations under the License.
rem

@echo off

rem Use JAVA_HOME if it's set; otherwise, just use java
IF "%JAVA_HOME%"=="" (SET JAVA_EXE=java) ELSE (SET JAVA_EXE=%JAVA_HOME%\bin\java.exe)

SET LIB_DIR=%~dp0..\lib
SET CONF_DIR=%~dp0..\conf

SET BOOTSTRAP_CONF_FILE=%CONF_DIR%\bootstrap.conf
SET JAVA_ARGS=-Dorg.apache.nifi.bootstrap.config.file=%BOOTSTRAP_CONF_FILE%

SET JAVA_PARAMS=-cp %LIB_DIR%\nifi-bootstrap*.jar -Xms12m -Xmx24m %JAVA_ARGS% org.apache.nifi.bootstrap.RunNiFi
SET BOOTSTRAP_ACTION=status

cmd.exe /C "%JAVA_EXE%" %JAVA_PARAMS% %BOOTSTRAP_ACTION%
