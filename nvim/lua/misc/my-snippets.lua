local fn = vim.fn

function InsertBashHeader()
	local cur_filename = fn.expand("%:t")
	local cur_fileending = fn.expand("%:e")
	local start_lines = {
		"#! /usr/bin/env bash",
		"",
		'SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"',
		'PROJECT_PATH="${SCRIPT_PATH%FOLDER_NAME*}FOLDER_NAME"',
		"",
		'INPUT_FOLDER="${SCRIPT_PATH}/input"',
		'OUTPUT_FOLDER="${SCRIPT_PATH}/output"',
		'mkdir -p "${OUTPUT_FOLDER}"',
		"",
	}
	fn.append(0, start_lines)
end

function InsertCommentHeader(header_name)
	local r, c = unpack(vim.api.nvim_win_get_cursor(0))
	local comment_header = {
		"# -------------------- " .. header_name .. " --------------------",
	}
	fn.append(r, comment_header)
end

function HighlightCharacter(name, format)
	-- Get the current buffer
	local buf = vim.api.nvim_get_current_buf()

	-- Get the text from the buffer
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	-- Define the text to find and replace
	-- local find_text = vim.fn.eval("@")
	local find_text = name

	local colors = { "003", "030", "300", "033", "303", "330" }
	local replace_text = '<span style="color:#'
		.. colors[tonumber(format)]
		.. '; font-weight: bold">'
		.. find_text
		.. " </span>"

	-- Iterate through the lines and perform replacement
	for i, line in ipairs(lines) do
		lines[i] = string.gsub(line, find_text, replace_text)
	end

	-- Set the modified lines back in the buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

function _ToggleForceWrap()
	local temp = vim.opt.formatexpr
	local force_wrap = false

	function toggle()
		force_wrap = not force_wrap
		if force_wrap then
			vim.opt.formatexpr = ""
		else
			vim.opt.formatexpr = temp
		end
	end

	return toggle
end

ToggleForceWrap = _ToggleForceWrap()

vim.cmd([[ command! InsertBashHeader call v:lua.InsertBashHeader() ]])
vim.cmd([[ command! -nargs=1 InsertCommentHeader call v:lua.InsertCommentHeader(<f-args>)]])
vim.cmd([[ command! -nargs=* HighlightCharacter call v:lua.HighlightCharacter(<f-args>)]])
vim.cmd([[ command! ToggleForceWrap call v:lua.ToggleForceWrap() ]])

-- Thumbs Uo and Thumbs Down
vim.cmd([[ command! ThumbsDown :norm i👎<esc> ]])
vim.cmd([[ command! ThumbsUp :norm i👍<esc> ]])
