_G.spacer:space {
	name = 'links',

	format = {
		{ name = 'id',        type = 'string'   },
		{ name = 'uid',       type = 'unsigned' },
		{ name = 'fdir',      type = 'string'   }, -- fold name
		{ name = 'fname',     type = 'string'   }, -- fold name
		{ name = 'hash',      type = 'string'   },
		{ name = 'ctime',     type = 'unsigned' },
		{ name = 'flags',     type = 'unsigned' }, -- WRITABLE, DOMESTIC
		{ name = 'extra',     type = 'map'      }, -- name
		{ name = 'expires',   type = 'unsigned', is_nullable = true },
	},

	indexes = {
		{ name = 'primary',   parts = { 'id' } },
		{ name = 'hash',      parts = { 'hash' } }, -- check name
		{ name = 'user',      parts = { 'uid', 'fdir', 'fname' } },
		{ name = 'ctime',     parts = { 'ctime', 'id' } },
		{ name = 'uid_ctime', parts = { 'uid', 'ctime', 'id' } },
		{ name = 'expires',   parts = { 'expires', 'id' }, },
	},
}
