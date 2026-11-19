local M = {}

--- Get the number of listed, open buffers.
---@return number
function M.get_buffer_count()
	local count = 0
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buflisted and vim.bo[buf].buftype ~= "nofile" then
			count = count + 1
		end
	end
	return count
end

return M
