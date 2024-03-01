-- Defines VIM indent attributes such as 'tabstop' 'softtabstop' and 'shiftwidth' to arg
function SetTabSettings(arg)
    local value = tonumber(arg)
        if value then
            vim.bo.tabstop = value
            vim.bo.softtabstop = value
            vim.bo.shiftwidth = value
        else
            print("Invalid argument. Please provide a valid integer")
    end
end

-- Sets the 'TSS' command to execute the setTabSettings() function
vim.cmd("command! -nargs=1 TSS lua SetTabSettings(<args>)")
vim.cmd("set expandtab")

-- Executes the setTabSettings() function using 'TSS' to change indentation according to filetype
vim.cmd("autocmd FileType go,java,lua TSS 4")
vim.cmd("autocmd FileType js,ts,jsx,tsx TSS 2")
