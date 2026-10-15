return {
  "liamvdvyver/zopen.nvim",
  opts = {},
  keys = {
    { '<leader>zp', function() require('zopen').cursor() end, desc = 'Zotero: open PDF' },
    { '<leader>zs', function() require('zopen').cursor('select') end, desc = 'Zotero: select item' },
    { '<leader>zP', function() require('zopen').file() end, desc = 'Zotero: file PDF' },
    { '<leader>zS', function() require('zopen').file('select') end, desc = 'Zotero: select file item' },
    { '<leader>zr', function() require('zopen').frontmatter('source') end, desc = 'Zotero: source PDF' },
    { '<leader>zR', function() require('zopen').frontmatter('source', 'select') end, desc = 'Zotero: select source' },
  }
}
