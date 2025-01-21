return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require('nvim-treesitter.configs').setup({
            -- Automatiquement installer les parsers quand vous ouvrez un fichier
            auto_install = true,

            -- Liste des parsers à installer (ou "all" pour tous les parsers)
            ensure_installed = {
                "lua",
                "python",
                "javascript",
                "html",
                "css",
                "bash",
                "json",
                "markdown",
                "yaml",
            },

            -- Installer les parsers de manière synchrone
            sync_install = false,

            -- Parsers à ignorer pendant l'installation
            ignore_install = {},

            -- Activer la coloration syntaxique Treesitter
            highlight = {
                enable = true, -- Activer la coloration syntaxique basée sur Treesitter
                additional_vim_regex_highlighting = false, -- Désactiver la coloration basée sur Vim pour améliorer les performances
            },

            -- Activer l'indentation basée sur Treesitter
            indent = {
                enable = true,
            },
        })
    end,
}
