local fn = vim.fn

function InsertBashHeader ()
    local cur_filename = fn.expand('%:t')
    local cur_fileending = fn.expand('%:e')
    local start_lines = {
        '#! /usr/bin/env bash',
        '',
        'SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"',
        'PROJECT_PATH="${SCRIPT_PATH%FOLDER_NAME*}FOLDER_NAME"',
        '',
        'INPUT_FOLDER="${SCRIPT_PATH}/input"',
        'OUTPUT_FOLDER="${SCRIPT_PATH}/output"',
        'mkdir -p "${OUTPUT_FOLDER}"',
        ''
    }
    fn.append(0, start_lines)
end


function InsertCommentHeader (header_name)
    local r,c = unpack(vim.api.nvim_win_get_cursor(0)) 
    local comment_header = {
        '# -------------------- '..header_name..' --------------------'
    }
    fn.append(r, comment_header)
end


vim.cmd[[ command! InsertBashHeader call v:lua.InsertBashHeader() ]]
vim.cmd[[ command! -nargs=1 InsertCommentHeader call v:lua.InsertCommentHeader(<f-args>)]]

