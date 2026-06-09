--- ============================================================================
--- @file coderunner.lua
--- @brief code runner nvim config
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
local opts = {
    mode = "toggleterm",
    filetype = {
        c = {
            "cd $dir &&",
            "gcc -g $fileName -o out/$fileNameWithoutExt &&",
            "out/$fileNameWithoutExt"
        },
        asm = {
            "cd $dir &&",
            "gcc -Og $fileName -o out/$fileNameWithoutExt -g &&",
            "out/$fileNameWithoutExt"
        },
        java = {
            "cd $dir &&",
            "javac $fileName -d bin/ &&",
            "java -cp bin/ $fileNameWithoutExt"
        },
        python = {
            "cd $dir &&",
            "python $fileName",
        },
        sql = {
            "cd $dir &&",
            "cat $fileName | sql database_name.db"
        }
    }
}

return opts
