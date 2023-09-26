return {
  "lervag/wiki.vim",
  -- lazy = true, ft = {'markdown'},
  -- FIX: Lazy loading this breaks Enter, BS, TAB, etc. tag navigation
  config = function()
    vim.g.wiki_select_method = {
      pages = require("wiki.telescope").pages,
      tags = require("wiki.telescope").tags,
      toc = require("wiki.telescope").toc,
    }
    -- TODO: do this in lua
    vim.cmd([[
      let g:wiki_root = '~/Documents/pkb/'
      let g:wiki_filetypes = ['md', 'org', 'tex']
      let g:wiki_link_extension = ''
      let g:wiki_export = {
      \ 'args' : '',
      \ 'from_format' : 'markdown',
      \ 'ext' : 'pdf',
      \ 'link_ext_replace': v:false,
      \ 'view' : v:true,
      \ 'output': fnamemodify(tempname(), ':h'),
      \}
      let g:wiki_tag_parsers = [
      \ g:wiki#tags#default_parser,
      \ { 'match': {x -> x =~# '^tags: '},
      \   'parse': {x -> split(matchstr(x, '^tags:\zs.*'), '[ ,]\+')},
      \   'make':  {t, x -> 'tags: ' . empty(t) ? '' : join(t, ', ')}}
      \]
      ]])
    vim.keymap.set("n", "<leader>wp", ":WikiPages<CR>")
    vim.keymap.set("n", "<leader>wt", ":WikiTags<CR>")
  end,
}
