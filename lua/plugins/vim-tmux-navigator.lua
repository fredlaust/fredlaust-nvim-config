return {
    'christoomey/vim-tmux-navigator',
    cmd = {
        'TmuxNavigateLeft',
        'TmuxNavigateDown',
        'TmuxNavigateUp',
        'TmuxNavigateRight',
        'TmuxNavigatePrevious',
        'TmuxNavigatorProcessList',
    },
    keys = {
        { '<c-h>', '<cmd><C-s>TmuxNavigateLeft<cr>' },
        { '<c-j>', '<cmd><C-s>TmuxNavigateDown<cr>' },
        { '<c-k>', '<cmd><C-s>TmuxNavigateUp<cr>' },
        { '<c-l>', '<cmd><C-s>TmuxNavigateRight<cr>' },
        { '<c-\\>', '<cmd><C-s>TmuxNavigatePrevious<cr>' },
    },
}
