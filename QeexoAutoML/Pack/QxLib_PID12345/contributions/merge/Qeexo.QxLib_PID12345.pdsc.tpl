<?xml version="1.0" encoding="UTF-8"?>

<package schemaVersion="1.7.7" xmlns:xs="http://www.w3.org/2001/XMLSchema-instance" xs:noNamespaceSchemaLocation="https://raw.githubusercontent.com/Open-CMSIS-Pack/Open-CMSIS-Pack-Spec/v1.7.7/schema/PACK.xsd">
  <vendor>Qeexo</vendor>
  <name>QxLib_PID12345</name>
  <releases>
    <release version="%{RELEASE_VERSION}%" date="%{RELEASE_DATE}%">
      Qeexo AutoML project ID 12345 %{RELEASE_VERSION}%
    </release>
  </releases>
  <url>http://www.qeexo.com/</url>
  <description>Qeexo Library Pack Project ID 12345</description>
  <components>
   <component Cclass="Machine Learning" Cgroup="Qeexo AutoML" Csub="Qeexo Custom Library PID12345" Cversion="1.0.0" >
      <description>AutoML Library Project ID 12345</description>
      <files>
        <file category="library" name="Lib/libQxClassifyEngine.a"/>
        <file category="include" name="Lib/QxAutoMLUser.h" />
      </files>
    </component>
  </components>
</package>
