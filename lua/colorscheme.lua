local colorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("未找到 colorscheme: " .. colorscheme .. "!!")
    return
end
