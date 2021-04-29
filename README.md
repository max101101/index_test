* `spacer:migrate_up(1)`
* `for i = 1, 1000000, 1 do box.space.links:insert(T.links.tuple{id = tostring(i), uid = i, email = "test", fdir= "test", fname = "test", hash = tostring(i), ctime = os.time(), flags = 0, extra = setmetatable({}, { __serialize = 'map' })}) end`
* `local start = os.time() spacer:migrate_up(1) return os.time() - start`
