---
--- Migration "1619707329_expires"
--- Date: 1619707329 - 04/29/21 17:42:09
---
local ops = require 'spacer.ops'
local moonwalker = require 'moonwalker'

return {
    up = function()
        box.space.links:format({})
        moonwalker {
            space = box.space.links,
            actor = function(t)
                local key = ops.index_key("links", 0, t)
                box.space.links:update(key, { { "=", 9, 0 } })
            end,
        }
        box.space.links:create_index("expires", {
          parts = { { 9, "unsigned",
              is_nullable = true
            }, { 1, "string",
              is_nullable = false
            } },
          type = "tree"
        })
        box.space.links:format({ {
            name = "id",
            type = "string"
          }, {
            name = "uid",
            type = "unsigned"
          }, {
            name = "fdir",
            type = "string"
          }, {
            name = "fname",
            type = "string"
          }, {
            name = "hash",
            type = "string"
          }, {
            name = "ctime",
            type = "unsigned"
          }, {
            name = "flags",
            type = "unsigned"
          }, {
            name = "extra",
            type = "map"
          }, {
            is_nullable = true,
            name = "expires",
            type = "unsigned"
          } })
    end,

    down = function()
        box.space.links:format({})
        assert(false, "Need to write explicitly a down migration for field removal")
        box.space.links.index.expires:drop()
        box.space.links:format({ {
            name = "id",
            type = "string"
          }, {
            name = "uid",
            type = "unsigned"
          }, {
            name = "fdir",
            type = "string"
          }, {
            name = "fname",
            type = "string"
          }, {
            name = "hash",
            type = "string"
          }, {
            name = "ctime",
            type = "unsigned"
          }, {
            name = "flags",
            type = "unsigned"
          }, {
            name = "extra",
            type = "map"
          } })
    end,
}
