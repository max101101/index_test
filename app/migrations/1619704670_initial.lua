---
--- Migration "1619704670_initial"
--- Date: 1619704670 - 04/29/21 16:57:50
---


return {
    up = function()
        box.schema.create_space("links", nil)
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
        box.space.links:create_index("primary", {
          parts = { { 1, "string",
              is_nullable = false
            } },
          type = "tree"
        })
        box.space.links:create_index("hash", {
          parts = { { 5, "string",
              is_nullable = false
            } },
          type = "tree"
        })
        box.space.links:create_index("user", {
          parts = { { 2, "unsigned",
              is_nullable = false
            }, { 3, "string",
              is_nullable = false
            }, { 4, "string",
              is_nullable = false
            } },
          type = "tree"
        })
        box.space.links:create_index("ctime", {
          parts = { { 6, "unsigned",
              is_nullable = false
            }, { 1, "string",
              is_nullable = false
            } },
          type = "tree"
        })
        box.space.links:create_index("uid_ctime", {
          parts = { { 2, "unsigned",
              is_nullable = false
            }, { 6, "unsigned",
              is_nullable = false
            }, { 1, "string",
              is_nullable = false
            } },
          type = "tree"
        })
        box.space._spacer_models:replace({"links"})
    end,

    down = function()
        box.space.links:drop()
        box.space._spacer_models:delete({"links"})
    end,
}
