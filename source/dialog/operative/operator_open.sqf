  _handle = createDialog "operativemaingui";
  waitUntil {dialog};
 
{_index = lbAdd [1500, _x select 8];
switch (_x select 7) do
{
  case "Ready": {
	lbSetColor [1500, _index, [1, 1, 1, 1]];
  };
  
  case "Injured": {
	lbSetColor [1500, _index, [1, 0, 0, 1]];
  };
  
  case "Operating": {
	lbSetColor [1500, _index, [0, 1, 0, 1]];
  };
  
  case "Healed": {
	lbSetColor [1500, _index, [1, 1, 1, 1]];
  };  
};
} forEach duws_operator_list;
lbSetCurSel [1500, 0];



