grp = group player;
[player] join grpNull;
ld = leader grp;
[ld] join grpNull;
player joinAsSilent [grp,1];
grp selectLeader player;
[ld] joinSilent grp;
