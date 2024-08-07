package("levibuildscript")
    add_urls("https://github.com/LiteLDev/LeviBuildScript.git")
    set_kind("binary")
    add_versions("0.1.0", "c114f86f40f7fc980deaff8c3e55f642278dd6f0")
    on_install(function (package)
        os.mv("rules/*", package:installdir("rules"))
    end)