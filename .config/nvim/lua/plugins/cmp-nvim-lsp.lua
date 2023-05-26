return {
    "hrsh7th/cmp-nvim-lsp",
    dependencies =
    {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "SirVer/ultisnips",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "dcampos/nvim-snippy",
        "dcampos/cmp-snippy",
    },
    config = function()
        require("cmp").setup({
            source = {
                {name = "nvim_lsp"}
            }
        })
    end,
}
