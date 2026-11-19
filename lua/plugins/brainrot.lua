return {
	"sahaj-b/brainrot.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		disable_phonk = false, -- skip phonk/overlay on "no errors"
		phonk_time = 1.0, -- seconds the phonk/image overlay stays
		min_error_duration = 0, -- minimum seconds errors must exist before phonk triggers (0 = instant)
		block_input = false, -- block input during phonk/overlay
		dim_level = 1, -- phonk overlay darkness 0..100

		sound_enabled = true, -- enable sounds
		image_enabled = true, -- enable images (needs image.nvim)

		boom_volume = 70, -- volume for vine boom sound (0..100)
		phonk_volume = 100, -- volume for phonk sound (0..100)

		-- boom_sound = "~/.config/nvim/assets/boom2.ogg", -- custom boom sound path (e.g., "~/sounds/boom.ogg")
		-- phonk_dir = "~/.config/nvim/assets/phonk", -- custom phonk folder path (e.g., "~/sounds/phonks")
		-- image_dir = "~/.config/nvim/assets/img", -- custom image folder path (e.g., "~/memes/images")
		boom_sound = nil,
		phonk_dir = nil,
		image_dir = nil,

		lsp_wide = true, -- track errors workspace-wide(get ALL lsp errors)
	},
}
