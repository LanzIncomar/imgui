project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    SetupCommonConfig()

    targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

    files {
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imgui_demo.cpp",

        "imgui.h",
        "imgui_internal.h",
        "imconfig.h",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",

        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_opengl3.cpp",
        "backends/imgui_impl_opengl3.h"
    }

    includedirs {
        ".",                          -- FIXED (was "")
        "backends",
        "../glfw/include"
    }

    links {
        "glfw"
    }

    filter "action:vs*"
        buildoptions { "/MP" }

    filter {}