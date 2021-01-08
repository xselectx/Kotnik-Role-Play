//grupy


#define MAX_GROUPS 100

stock KRP_LoadGroups()
{
	 string = "`UID`, `pUID`, `fUID`, `type`, `name`, `rank0` \
	 `rank1`, `rank2, `rank3`, `rank4`, `rank5, `rank6`, `rank7`, `block`";
    format(string, 1024, "SELECT %s FROM `mru_groups`", string));
    print(string);
	mysql_query(lStr);
	mysql_store_result();
}
