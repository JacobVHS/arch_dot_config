-- module to handle live git diff and blames

return {
	"tanvirtin/vgit.nvim",
  event = 'VimEnter',
	config = function()
    require("vgit").setup()
	end
}

