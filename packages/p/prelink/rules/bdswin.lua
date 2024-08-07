rule("bdswin")
    before_link(function (target)
        import("lib.detect.find_file")
        os.mkdir("$(buildir)/.prelink/lib")
        local args = {}
        for i, obj in ipairs(target:objectfiles()) do
            args[i] = path.absolute(obj)
        end
        local data = assert(find_file("bedrock_runtime_data", {"$(env PATH)"}), "Cannot find bedrock_runtime_data")
        local link = assert(find_file("prelink.exe", {"$(env PATH)"}), "Cannot find prelink.exe")

        args = table.join({vformat("$(buildir)/.prelink"), path.absolute(data)}, args)
        os.runv(link, args)
        target:add("linkdirs", "$(buildir)/.prelink/lib")
        target:add("shflags", "bedrock_server_api.lib", {force = true})
        target:add("shflags", "bedrock_server_var.lib", {force = true})
    end)
    after_link(function (target)
        os.rm("$(buildir)/.prelink/lib/*.lib")
    end)
rule_end()