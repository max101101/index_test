assert(instance_name, "instance_name is required from symlink")

box = {
	background              = true,
	pid_file                = instance_name..".pid",
	work_dir                = "/var/lib/tarantool/"..instance_name,
	memtx_dir               = "/var/lib/tarantool/snaps/"..instance_name,
	wal_dir                 = "/var/lib/tarantool/xlogs/"..instance_name,
}
