local M = {}

local function parse_template(file)
    local lines = {}
    for line in io.lines(file) do
        table.insert(lines, line)
    end
    return table.concat(lines, "\n")
end


local templates = {
    TypstNote = parse_template("./typstnote.txt"),
    CPP = parse_template("./cpptemplate.txt")
}

local function insert_template(name)
    local template = M.templates[name]
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
        return vim.tbl_filter(function(template)
            return template:match("^" .. ArgLead)
        end, templates)
    end,
})

return M
