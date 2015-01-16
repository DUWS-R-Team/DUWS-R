/*
	@version: 1.9
	@file_name: fn_filter.sqf
	@file_author: TAW_Tonic
	@file_edit: 9/1/2013
	@file_description: Takes current array of items and filters it for what we need.
*/
private["_items","_filter","_ret","_itemInfo","_type","_details"];
_items = _this select 0;
_filter = _this select 1;
_ret = [];
{
	if(_x != "") then
	{
		_details = [_x] call VAS_fnc_fetchCfgDetails;
		if(count _details == 0) exitWith {_ret};
		_type = _details select 4;
		_itemInfo = _details select 5;
		
		switch (true) do
		{
			case ((_details select 6) == "CfgMagazines") :
			{
				if(typeName _filter == "STRING") then
				{
					if(_filter == "mag") then
					{
						_ret set[count _ret,_x];
					};
				};
			};
			
			case ((_details select 6) == "CfgGlasses" && typeName _filter == "STRING") :
			{
				if(_filter == "glass") then
				{
					_ret set[count _ret,_x];
				};
			};
			
			case (_type in [1,2,4,5,4096] && (_itemInfo == 0 OR _itemInfo == -1)) :
			{
				switch(typeName _filter) do
				{
					case "ARRAY":
					{
						if(_type in _filter) then
						{
							_ret set [count _ret,_x];
						};
					};
					
					case "SCALAR":
					{
						if(_type == _filter) then
						{
							_ret set [count _ret,_x];
						};
					};
				};
			};
			
			case (_type in [4096,131072]) :
			{
				if(_type == 4096 && _itemInfo == 0) exitWith {};
				switch(typeName _filter) do
				{
					case "ARRAY":
					{
						if(_itemInfo in _filter) then
						{
							_ret set[count _ret,_x];
						};
					};
					
					case "SCALAR":
					{
						switch (true) do
						{
							case (_itemInfo == _filter) : {_ret set[count _ret,_x];};
							case (_type == _filter) : {_ret set[count _ret,_x];};
						};
					};
					
					case "STRING":
					{
						if(_filter == "items") then
						{
							_ret set[count _ret,_x];
						};
					};
				};
			};
			
			case (typeName _type == "STRING" && typeName _filter == "STRING") :
			{
				if(_type == "Backpacks" && _filter == "packs") then
				{
					_ret set[count _ret,_x];
				};
			};
		};
	};
} foreach _items;

_ret