--- ============================================================================
--- @file init.lua
--- @brief neovim plugin initialization file
---
---
--- @author sudoCompetence
--- @date 2026-01-31
--- ============================================================================
-- vim.env.PYTHONNOUSERSITE = "1"
return {
  --    .-----.  .-'),-----. ,------. (,------.
  --   '  .--./ ( OO'  .-.  '|   /`. ' |  .---'
  --   |  |('-. /   |  | |  ||  /  | | |  |
  --  /_) |OO  )\_) |  |\|  ||  |_.' |(|  '--.
  --  ||  |`-'|   \ |  | |  ||  .  '.' |  .--'
  -- (_'  '--'\    `'  '-'  '|  |\  \  |  `---.
  --    `-----'      `-----' `--' '--' `------'
  {
    "stevearc/conform.nvim",
    lazy = false,
    event = "BufWritePre", -- format on save
    opts = require "configs.conform",
  },

  --             .-')     _ (`-.
  --            ( OO ).  ( (OO  )
  --  ,--.     (_)---\_)_.`     \
  --  |  |.-') /    _ |(__...--''
  --  |  | OO )\  :` `. |  /  | |
  --  |  |`-' | '..`''.)|  |_.' |
  -- (|  '---.'.-._)   \|  .___.'
  --  |      | \       /|  |
  --  `------'  `-----' `--'
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },

  --          <-. (`-')  _  (`-')
  --  _          \(OO )_ \-.(OO )
  --  \-,-----,--./  ,-.)_.'    \
  --   |  .--.|   `.'   (_...--''
  --  /_) (`-'|  |'.'|  |  |_.' |
  --  ||  |OO |  |   |  |  .___.'
  -- (_'  '--'|  |   |  |  |
  --    `-----`--'   `--`--'
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",

      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      {
        "hrsh7th/cmp-cmdline",
        event = "CmdlineEnter",
        config = function()
          require "configs.cmp-cmdline"
        end,
      },
    },

    config = function(_, opts)
      opts = require "configs.cmp"
      return opts
    end,
  },

  --                    (`-.      ('-.  _  .-')  _  .-')          _ .-') _     ('-.
  --                  _(OO  )_  _(  OO)( \( -O )( \( -O )        ( (  OO) )  _(  OO)
  --  .-'),-----. ,--(_/   ,. \(,------.,------. ,------.  ,-.-') \     .'_ (,------.
  -- ( OO'  .-.  '\   \   /(__/ |  .---'|   /`. '|   /`. ' |  |OO),`'--..._) |  .---'
  -- /   |  | |  | \   \ /   /  |  |    |  /  | ||  /  | | |  |  \|  |  \  ' |  |
  -- \_) |  |\|  |  \   '   /, (|  '--. |  |_.' ||  |_.' | |  |(_/|  |   ' |(|  '--.
  --   \ |  | |  |   \     /__) |  .--' |  .  '.'|  .  '.',|  |_.'|  |   / : |  .--'
  --    `'  '-'  '    \   /     |  `---.|  |\  \ |  |\  \(_|  |   |  '--'  / |  `---.
  --      `-----'      `-'      `------'`--' '--'`--' '--' `--'   `-------'  `------'
  -- _   .-')      ('-.      .-')                     .-') _
  -- ( '.( OO )_   ( OO ).-. ( OO ).                  ( OO ) )
  --  ,--.   ,--.) / . --. /(_)---\_) .-'),-----. ,--./ ,--,'
  --  |   `.'   |  | \-.  \ /    _ | ( OO'  .-.  '|   \ |  |\
  --  |         |.-'-'  |  |\  :` `. /   |  | |  ||    \|  | )
  --  |  |'.'|  | \| |_.'  | '..`''.)\_) |  |\|  ||  .     |/
  --  |  |   |  |  |  .-.  |.-._)   \  \ |  | |  ||  |\    |
  --  |  |   |  |  |  | |  |\       /   `'  '-'  '|  | \   |
  --  `--'   `--'  `--' `--' `-----'      `-----' `--'  `--'
  {
    "mason-org/mason.nvim",
    opts = function(_, opts_override)
      opts_override = require("configs.overrides.mason").override
      return opts_override
    end,
  },
  --  .-') _   _  .-')     ('-.     ('-.    .-')             .-') _    .-') _     ('-.  _  .-')
  -- (  OO) ) ( \( -O )  _(  OO)  _(  OO)  ( OO ).          (  OO) )  (  OO) )  _(  OO)( \( -O )
  -- /     '._ ,------. (,------.(,------.(_)---\_)  ,-.-') /     '._ /     '._(,------.,------.
  -- |'--...__)|   /`. ' |  .---' |  .---'/    _ |   |  |OO)|'--...__)|'--...__)|  .---'|   /`. '
  -- '--.  .--'|  /  | | |  |     |  |    \  :` `.   |  |  \'--.  .--''--.  .--'|  |    |  /  | |
  --    |  |   |  |_.' |(|  '--. (|  '--.  '..`''.)  |  |(_/   |  |      |  |  (|  '--. |  |_.' |
  --    |  |   |  .  '.' |  .--'  |  .--' .-._)   \ ,|  |_.'   |  |      |  |   |  .--' |  .  '.'
  --    |  |   |  |\  \  |  `---. |  `---.\       /(_|  |      |  |      |  |   |  `---.|  |\  \
  --    `--'   `--' '--' `------' `------' `-----'   `--'      `--'      `--'   `------'`--' '--'
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts_override)
      opts_override = require("configs.overrides.treesitter").override
      return opts_override
    end,
  },

  --      .-') _      (`-.           _   .-')     .-') _   _  .-')     ('-.     ('-.
  --     ( OO ) )   _(OO  )_        ( '.( OO )_  (  OO) ) ( \( -O )  _(  OO)  _(  OO)
  -- ,--./ ,--,',--(_/   ,. \ ,-.-') ,--.   ,--.)/     '._ ,------. (,------.(,------.
  -- |   \ |  |\\   \   /(__/ |  |OO)|   `.'   | |'--...__)|   /`. ' |  .---' |  .---'
  -- |    \|  | )\   \ /   /  |  |  \|         | '--.  .--'|  /  | | |  |     |  |
  -- |  .     |/  \   '   /,  |  |(_/|  |'.'|  |    |  |   |  |_.' |(|  '--. (|  '--.
  -- |  |\    |    \     /__),|  |_.'|  |   |  |    |  |   |  .  '.' |  .--'  |  .--'
  -- |  | \   |     \   /   (_|  |   |  |   |  |    |  |   |  |\  \  |  `---. |  `---.
  -- `--'  `--'      `-'      `--'   `--'   `--'    `--'   `--' '--' `------' `------'
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = function(_, opts_override)
      opts_override = require("configs.overrides.nvimtree").override
      return opts_override
    end,
  },
  --                      .-') _
  --                     (  OO) )
  --   ,----.     ,-.-') /     '._
  --  '  .-./-')  |  |OO)|'--...__)
  --  |  |_( O- ) |  |  \'--.  .--'
  --  |  | .--, \ |  |(_/   |  |
  -- (|  | '. (_/,|  |_.'   |  |
  --  |  '--'  |(_|  |      |  |
  --   `------'   `--'      `--'
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "https://github.com/tpope/vim-fugitive" },
    config = function()
      require("telescope").load_extension "lazygit"
    end,
  },

  --                      .-') _     .-')                             .-') _   .-')
  --                     (  OO) )   ( OO ).                          ( OO ) ) ( OO ).
  --   ,----.     ,-.-') /     '._ (_)---\_)  ,-.-')   ,----.    ,--./ ,--,' (_)---\_)
  --  '  .-./-')  |  |OO)|'--...__)/    _ |   |  |OO) '  .-./-') |   \ |  |\ /    _ |
  --  |  |_( O- ) |  |  \'--.  .--'\  :` `.   |  |  \ |  |_( O- )|    \|  | )\  :` `.
  --  |  | .--, \ |  |(_/   |  |    '..`''.)  |  |(_/ |  | .--, \|  .     |/  '..`''.)
  -- (|  | '. (_/,|  |_.'   |  |   .-._)   \ ,|  |_.'(|  | '. (_/|  |\    |  .-._)   \
  --  |  '--'  |(_|  |      |  |   \       /(_|  |    |  '--'  | |  | \   |  \       /
  --   `------'   `--'      `--'    `-----'   `--'     `------'  `--'  `--'   `-----'
  -- {
  --     "lewis6991/gitsigns.nvim",
  --     opts = function(_, opts)
  --         local override = require("configs.overrides.gitsigns").override
  --         return vim.tbl_deep_extend("force", opts, override)
  --     end,
  -- },

  --                   .-') _  _ .-') _                .-') _   _  .-')     ('-.     ('-.
  --                  ( OO ) )( (  OO) )              (  OO) ) ( \( -O )  _(  OO)  _(  OO)
  --  ,--. ,--.   ,--./ ,--,'  \     .'_  .-'),-----. /     '._ ,------. (,------.(,------.
  --  |  | |  |   |   \ |  |\  ,`'--..._)( OO'  .-.  '|'--...__)|   /`. ' |  .---' |  .---'
  --  |  | | .-') |    \|  | ) |  |  \  '/   |  | |  |'--.  .--'|  /  | | |  |     |  |
  --  |  |_|( OO )|  .     |/  |  |   ' |\_) |  |\|  |   |  |   |  |_.' |(|  '--. (|  '--.
  --  |  | | `-' /|  |\    |   |  |   / :  \ |  | |  |   |  |   |  .  '.' |  .--'  |  .--'
  -- ('  '-'(_.-' |  | \   |   |  '--'  /   `'  '-'  '   |  |   |  |\  \  |  `---. |  `---.
  --   `-----'    `--'  `--'   `-------'      `-----'    `--'   `--' '--' `------' `------'
  {
    "mbbill/undotree",
    lazy = false,
    config = function()
      require "configs.undotree"
    end,
  },

  --               .-') _  .-') _     ('-.  _  .-')              ('-.                  ('-.
  --              ( OO ) )(  OO) )  _(  OO)( \( -O )            ( OO ).-.            _(  OO)
  --   ,-.-') ,--./ ,--,' /     '._(,------.,------.    ,------./ . --. /   .-----. (,------.
  --   |  |OO)|   \ |  |\ |'--...__)|  .---'|   /`. '('-| _.---'| \-.  \   '  .--./  |  .---'
  --   |  |  \|    \|  | )'--.  .--'|  |    |  /  | |(OO|(_\  .-'-'  |  |  |  |('-.  |  |
  --   |  |(_/|  .     |/    |  |  (|  '--. |  |_.' |/  |  '--.\| |_.'  | /_) |OO  )(|  '--.
  --  ,|  |_.'|  |\    |     |  |   |  .--' |  .  '.'\_)|  .--' |  .-.  | ||  |`-'|  |  .--'
  -- (_|  |   |  | \   |     |  |   |  `---.|  |\  \   \|  |_)  |  | |  |(_'  '--'\  |  `---.
  --   `--'   `--'  `--'     `--'   `------'`--' '--'   `--'    `--' `--'   `-----'  `------'
  --  _ .-') _     ('-.      .-')    ('-. .-..-. .-')                  ('-.     _  .-')  _ .-') _
  -- ( (  OO) )   ( OO ).-. ( OO ). ( OO )  /\  ( OO )                ( OO ).-.( \( -O )( (  OO) )
  --  \     .'_   / . --. /(_)---\_),--. ,--. ;-----.\  .-'),-----.   / . --. / ,------. \     .'_
  --  ,`'--..._)  | \-.  \ /    _ | |  | |  | | .-.  | ( OO'  .-.  '  | \-.  \  |   /`. ',`'--..._)
  --  |  |  \  '.-'-'  |  |\  :` `. |   .|  | | '-' /_)/   |  | |  |.-'-'  |  | |  /  | ||  |  \  '
  --  |  |   ' | \| |_.'  | '..`''.)|       | | .-. `. \_) |  |\|  | \| |_.'  | |  |_.' ||  |   ' |
  --  |  |   / :  |  .-.  |.-._)   \|  .-.  | | |  \  |  \ |  | |  |  |  .-.  | |  .  '.'|  |   / :
  --  |  '--'  /  |  | |  |\       /|  | |  | | '--'  /   `'  '-'  '  |  | |  | |  |\  \ |  '--'  /
  --  `-------'   `--' `--' `-----' `--' `--' `------'      `-----'   `--' `--' `--' '--'`-------'
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    lazy = false,
    config = function()
      require "configs.dashboard"
    end,
  },

  --      .-') _               .-') _                                        ('-.     .-') _                            .-') _   .-')
  --     ( OO ) )             (  OO) )                                      ( OO ).-.(  OO) )                          ( OO ) ) ( OO ).
  -- ,--./ ,--,'  .-'),-----. /     '._ ,-.-')    ,------.,-.-')   .-----.  / . --. //     '._ ,-.-')  .-'),-----. ,--./ ,--,' (_)---\_)
  -- |   \ |  |\ ( OO'  .-.  '|'--...__)|  |OO)('-| _.---'|  |OO) '  .--./  | \-.  \ |'--...__)|  |OO)( OO'  .-.  '|   \ |  |\ /    _ |
  -- |    \|  | )/   |  | |  |'--.  .--'|  |  \(OO|(_\    |  |  \ |  |('-..-'-'  |  |'--.  .--'|  |  \/   |  | |  ||    \|  | )\  :` `.
  -- |  .     |/ \_) |  |\|  |   |  |   |  |(_//  |  '--. |  |(_//_) |OO  )\| |_.'  |   |  |   |  |(_/\_) |  |\|  ||  .     |/  '..`''.)
  -- |  |\    |    \ |  | |  |   |  |  ,|  |_.'\_)|  .--',|  |_.'||  |`-'|  |  .-.  |   |  |  ,|  |_.'  \ |  | |  ||  |\    |  .-._)   \
  -- |  | \   |     `'  '-'  '   |  | (_|  |     \|  |_)(_|  |  (_'  '--'\  |  | |  |   |  | (_|  |      `'  '-'  '|  | \   |  \       /
  -- `--'  `--'       `-----'    `--'   `--'      `--'    `--'     `-----'  `--' `--'   `--'   `--'        `-----' `--'  `--'   `-----'
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup(opts)
      vim.notify = require "notify"
    end,
  },

  --                           .-') _                         .-') _   ('-.
  --                          (  OO) )                       ( OO ) )_(  OO)
  --  .-'),-----.  ,--. ,--.  /     '._ ,--.      ,-.-') ,--./ ,--,'(,------.
  -- ( OO'  .-.  ' |  | |  |  |'--...__)|  |.-')  |  |OO)|   \ |  |\ |  .---'
  -- /   |  | |  | |  | | .-')'--.  .--'|  | OO ) |  |  \|    \|  | )|  |
  -- \_) |  |\|  | |  |_|( OO )  |  |   |  |`-' | |  |(_/|  .     |/(|  '--.
  --   \ |  | |  | |  | | `-' /  |  |  (|  '---.',|  |_.'|  |\    |  |  .--'
  --    `'  '-'  '('  '-'(_.-'   |  |   |      |(_|  |   |  | \   |  |  `---.
  --      `-----'   `-----'      `--'   `------'  `--'   `--'  `--'  `------'
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
  },

  --   .-')            _ .-') _     ('-. .-. .-')     ('-.     _  .-')
  --  ( OO ).         ( (  OO) )  _(  OO)\  ( OO )   ( OO ).-.( \( -O )
  -- (_)---\_)  ,-.-') \     .'_ (,------.;-----.\   / . --. / ,------.
  -- /    _ |   |  |OO),`'--..._) |  .---'| .-.  |   | \-.  \  |   /`. '
  -- \  :` `.   |  |  \|  |  \  ' |  |    | '-' /_).-'-'  |  | |  /  | |
  --  '..`''.)  |  |(_/|  |   ' |(|  '--. | .-. `.  \| |_.'  | |  |_.' |
  -- .-._)   \ ,|  |_.'|  |   / : |  .--' | |  \  |  |  .-.  | |  .  '.'
  -- \       /(_|  |   |  '--'  / |  `---.| '--'  /  |  | |  | |  |\  \
  --  `-----'   `--'   `-------'  `------'`------'   `--' `--' `--' '--'
  {
    "sidebar-nvim/sidebar.nvim",
    lazy = false,
    -- opts = require("configs.sidebar"),
    config = function(_, opts)
      opts = require "configs.sidebar"
      return opts
    end,
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    opts = function(_, opts)
      require("scrollbar.handlers.gitsigns").setup()
      opts = require "configs.sidebar"
      return opts
    end,
  },

  -- -- comments
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
      opts = require "configs.comments"
      return opts
    end,
  },

  -- bookmarks
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    lazy = false,
    dependencies = { "MattesGroeger/vim-bookmarks" },
    config = function()
      require("telescope").load_extension "vim_bookmarks"
    end,
  },

  -- -- ufo (fold columns)
  {
    "kevinhwang91/nvim-ufo",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "kevinhwang91/promise-async" },
    config = function(_, opts)
      opts = require "configs.ufo"
      return opts
    end,
  },

  --              .-') _                             .-') _             ('-.    .-')
  --             (  OO) )                           (  OO) )          _(  OO)  ( OO ).
  --  ,--. ,--.  /     '._ ,-.-')  ,--.      ,-.-') /     '._ ,-.-') (,------.(_)---\_)
  --  |  | |  |  |'--...__)|  |OO) |  |.-')  |  |OO)|'--...__)|  |OO) |  .---'/    _ |
  --  |  | | .-')'--.  .--'|  |  \ |  | OO ) |  |  \'--.  .--'|  |  \ |  |    \  :` `.
  --  |  |_|( OO )  |  |   |  |(_/ |  |`-' | |  |(_/   |  |   |  |(_/(|  '--.  '..`''.)
  --  |  | | `-' /  |  |  ,|  |_.'(|  '---.',|  |_.'   |  |  ,|  |_.' |  .--' .-._)   \
  -- ('  '-'(_.-'   |  | (_|  |    |      |(_|  |      |  | (_|  |    |  `---.\       /
  --   `-----'      `--'   `--'    `------'  `--'      `--'   `--'    `------' `-----'
  -- tmux navigation
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
      require("toggleterm").setup()
    end,
  },

  -- code runner
  {
    "CRAG666/code_runner.nvim",
    lazy = false,
    opts = require "configs.coderunner",
    config = function(_, opts)
      opts = require("code_runner").setup(opts)
      return opts
    end,
  },

  -- harpoon
  {
    "ThePrimeagen/harpoon",
    lazy = true,
  },

  -- hop
  {

    "smoka7/hop.nvim",
    lazy = false,
    opts = require "configs.hopper",
    config = function(_, opts)
      opts = require("hop").setup(opts)
      return opts
    end,
  },

  -- multi-cursor
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
  },

  -- --              ('-.     .-') _     ('-.  ) (`-.
  -- --             ( OO ).-.(  OO) )  _(  OO)  ( OO ).
  -- --  ,--.       / . --. //     '._(,------.(_/.  \_)-.
  -- --  |  |.-')   | \-.  \ |'--...__)|  .---' \  `.'  /
  -- --  |  | OO ).-'-'  |  |'--.  .--'|  |      \     /\
  -- --  |  |`-' | \| |_.'  |   |  |  (|  '--.    \   \ |
  -- -- (|  '---.'  |  .-.  |   |  |   |  .--'   .'    \_)
  -- --  |      |   |  | |  |   |  |   |  `---. /  .'.  \
  -- --  `------'   `--' `--'   `--'   `------''--'   '--'
  {
    "lervag/vimtex",
    lazy = false,
    config = function(_, opts)
      opts = require "configs.vimtex"
      return opts
    end,
  },

  -- --    `.( OO ),' _(  OO)\  ( OO )( (  OO) )  _(  OO)     _(OO  )_
  -- -- ,--./  .--.  (,------.;-----.\ \     .'_ (,------.,--(_/   ,. \
  -- -- |      |  |   |  .---'| .-.  | ,`'--..._) |  .---'\   \   /(__/
  -- -- |  |   |  |,  |  |    | '-' /_)|  |  \  ' |  |     \   \ /   /
  -- -- |  |.'.|  |_)(|  '--. | .-. `. |  |   ' |(|  '--.   \   '   /,
  -- -- |         |   |  .--' | |  \  ||  |   / : |  .--'    \     /__)
  -- -- |   ,'.   |   |  `---.| '--'  /|  '--'  / |  `---.    \   /
  -- -- '--'   '--'   `------'`------' `-------'  `------'     `-'
  -- {
  --     "ray-x/web-tools.nvim", lazy = false,
  --     dependencies = { "cakebaker/scss-syntax.vim" },
  --     opts = function()
  --         return overrides.webtools
  --     end,
  --     config = function (_, opts)
  --         require'web-tools'.setup(opts)
  --     end
  -- },
  -- {
  --     "Vimjas/vim-python-pep8-indent",
  --     lazy = false,
  --     ft = "python",
  -- },
}
