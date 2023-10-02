<?xml version="1.0" encoding="UTF-8"?>

<package schemaVersion="1.7.7" xmlns:xs="http://www.w3.org/2001/XMLSchema-instance" xs:noNamespaceSchemaLocation="https://raw.githubusercontent.com/Open-CMSIS-Pack/Open-CMSIS-Pack-Spec/v1.7.7/schema/PACK.xsd">
  <vendor>Qeexo</vendor>
  <name>QxLib_PID12345</name>
  <releases>
    <release version="%{RELEASE_VERSION}%" date="%{RELEASE_DATE}%">
      Qeexo AutoML project ID 12345 %{RELEASE_VERSION}%
    </release>
  </releases>
  <description>Qeexo Library Pack Project ID 12345</description>
  <condition id="CM4_CM7">
    <description>Cortex-M4 based device</description>
    <accept  Dcore="Cortex-M4"/>
    <accept  Dcore="Cortex-M7"/>
  </condition>
  <softwareComponents>
    <softwareComponent name="Qeexo Library">
      <files>
        <file name="Lib/libQxClassifyEngine.a"/>
        <include name="Include/QxAutoMLUser.h" />
      </files>
      <dependencies>
      </dependencies>
    </softwareComponent>
  </softwareComponents>
</package>
