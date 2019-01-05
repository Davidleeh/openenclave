# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

# NOTE: Hosted Visual Studio 2017 instances in Azure DevOps for Continuous
# Integration (CI) do not have the WDK installed. We work around this by having
# CI download a custom WDK package that has the files we need, and nothing more
# seeing as installing the WDK from the official package is not trivial. This
# is what the WDKCIOverride environment variable is used for.

if(DEFINED ENV{WDKCIOverride})
    set(WDK_PATH ENV{WDKCIOverride})
else()
    if(DEFINED ENV{WDKContentRoot})
        file(GLOB WDK_PATH "$ENV{WDKContentRoot}/Include/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/km")
    else()
        file(GLOB WDK_PATH "$ENV{ProgramFiles\(x86\)}/Windows Kits/10/Include/${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}/km")
    endif()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(WDK REQUIRED_VARS WDK_PATH)
