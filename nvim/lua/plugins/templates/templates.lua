local path = vim.fn.stdpath("config") .. "/lua/plugins/templates/"
return {
    "local-templates",
    lazy = false,
    dir = path,
    config = function()
        local path = vim.fn.stdpath("config") .. "/lua/plugins/templates/"

        local function parse_template(name)
            local lines = {}
            for line in io.lines(path .. name) do
                table.insert(lines, line)
            end
            return table.concat(lines, "\n")
        end

        local function load_templates()
            local templates = {}
            local files = vim.fn.globpath(path, "*.txt", false, true)
            for _, file in ipairs(files) do
                local name = vim.fn.fnamemodify(file, ":t:r")
                templates[name] = parse_template(name .. ".txt")
            end
            return templates
        end

        local templates = load_templates()

        local function insert_template(name)
            local template = templates[name]
            if not template then
                vim.notify("Template not found")
                return
            end
            vim.api.nvim_put(vim.split(template, "\n"), "l", true, true)
        end

        vim.api.nvim_create_user_command("Template", function(opts)
            insert_template(opts.args)
        end, {
            nargs = 1,
            complete = function(ArgLead)
                return vim.tbl_filter(function(t)
                    return t:match("^" .. ArgLead)
                end, vim.tbl_keys(templates))
            end,
        })
    end
}
