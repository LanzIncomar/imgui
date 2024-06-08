project "ImGui"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"


   -- Add the source files to the project
   files {
    "imgui_demo.cpp",
    "imgui_draw.cpp",
    "imgui_tables.cpp",
    "imgui_widgets.cpp",
    "imgui.cpp",
    "imconfig.h",
    "imgui_internal.h",
    "imgui.h",
    "imstb_rectpack.h",
    "imstb_textedit.h",
    "imstv_truetype.h",
    "backends/imgui_impl_opengl3.cpp",
    "backends/imgui_impl_opengl3.h",
    "backends/imgui_impl_glfw.cpp",
    "backends/imgui_impl_glfw.h",
    }
    -- Add the include directories
   includedirs {
    "extern/glfw/include",
    "", --for the root folder
   }

    -- Add the library directories
   libdirs {}
    
    -- Add the dependant project
   links {}

   targetdir ("bin/" .. OutputDir .. "/%{prj.name}")
   objdir ("bin/Intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"