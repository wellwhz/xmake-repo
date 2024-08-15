package("bedrockdata")
    set_kind("binary")

    if is_plat("windows") and is_arch("x64") then
        set_urls("https://github.com/LiteLDev/bedrock-runtime-data/releases/download/$(version)/bedrock-runtime-data-windows-x64.zip")
        add_versions("1.21.3.1-server", "ee8a2abc48b4cdeed9761adc3cbbe741b3224e5b2ed7c61a45cee3ae2d4750fe")
        add_versions("1.21.0.3-server", "54ecd5130b6aeec9971bc5f5c9b7cc82a9aecc21b4745c193bc7b78d8eeaf78c")
        add_versions("1.21.0.3-client", "2a920443a16b596707e20d6c351fb9f3b572e39a99b447a1276d26470c30c460")
    end

    add_deps("prelink")

    on_install(function (package)
        os.mv("*", package:installdir("bin"))
        package:addenv("PATH", "bin")
    end)
