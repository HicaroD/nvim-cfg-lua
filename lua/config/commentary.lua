--[[---------------------------------------]]--
--                nvim_comment               --
--               Author: HícaroD             --
--[[---------------------------------------]]--

local status_ok, nvim_comment = pcall(require, "nvim_comment")
if not status_ok then
   return
end

nvim_comment.setup {
   comment_empty = true,
   marker_padding = true,
   create_mappings = true,
   comment_empty_trim_whitespace = true,
   hook = nil
}
