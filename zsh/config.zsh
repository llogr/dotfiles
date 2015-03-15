if "$ZSH/tools/require_tool.sh" docker 2>/dev/null ; then
	$(boot2docker shellinit 2>/dev/null)
fi