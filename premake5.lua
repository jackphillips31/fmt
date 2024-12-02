project "fmt"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin/" .. outputdir .. "/obj")

	files
	{
		"src/format.cc",
		"include/fmt/**.h"
	}

	includedirs
	{
		"include"
	}

	defines
	{
		"FMT_UNICODE=0"
	}

	filter "system:windows"
		systemversion "latest"
		defines
		{
			"FMT_OS=1"
		}

	filter "system:linux"
		defines
		{
			"FMT_OS=0"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"