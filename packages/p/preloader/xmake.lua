package("preloader")
    set_description("The preloader package")

    add_urls("https://github.com/LiteLDev/PreLoader.git")
    add_versions("v1.0.3", "9ec6cd9c2e0590e02229037435a15036eedd925a")
    add_versions("v1.1.0", "0b54d73ade8e534c390fae5451e3e541b74c184e")
    add_versions("v1.2.0", "9fa4a932867b51bf50193838e47944e70175212c")
    add_versions("v1.3.0", "1007284479673a1b14560dfbd94a92f8645777f3")
    add_versions("v1.3.1", "4a50d1d686ec2c9410bdfa7575f0ee9968790515")
    add_versions("v1.4.0", "4a50d1d686ec2c9410bdfa7575f0ee9968790515")
    add_versions("v1.4.2", "19ac92711210d6b57a8b007b63d028b19c150fff")
    add_versions("v1.4.3", "e751e3804811921b71624fa130b6820adf9e846b")
    add_versions("v1.5.0", "a2c5b6dba1352766df845d06cfdd447ab671c075")
    add_versions("v1.5.2", "0d4cd3ffac9435dd945030d20153103e5f8f39e9")
    add_versions("v1.6.0", "21d715b95642fd8148ba2bb3098a8850778f6fe4")
    add_versions("v1.6.1", "a7d0fc0474475036311145a38f3e0b6b22858e46")

    add_configs("shared", {description = "Build shared library.", default = true, type = "boolean", readonly = true})

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end
        import("package.tools.xmake").install(package, configs)
    end)
