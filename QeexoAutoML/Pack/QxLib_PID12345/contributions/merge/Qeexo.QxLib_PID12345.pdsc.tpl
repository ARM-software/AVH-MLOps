<?xml version="1.0" encoding="UTF-8"?>
<package schemaVersion="1.2" xmlns="http://www.arm.com/CMSIS-Pack"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://www.arm.com/CMSIS-Pack http://www.arm.com/CMSIS-Pack/CMSIS-Pack.xsd">
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
