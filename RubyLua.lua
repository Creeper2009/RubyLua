--
-- RubyLua 1.0
--

function R(f)
	local function each(a,f)
		for i=1,#a do
			(f)(a[i])
		end
	end
	local function include(a,s)
		for i=1,#a do
			if(a[i] == s) then
				return true
			end
		end
		return false
	end
	local function hasOwnProperty(t,s)
		return not not t[s]
	end
	local function uniq(s)
		local u = {}
		local a = {}
		local i = 0;
		local l = #s;
		local continue = function() return end
		while i < l do
			if(hasOwnProperty(u,_G[i])) then
				continue()
			end
			a[#a+1] = _G[i]
			u[_G[i]] = 1;
			i = i + 1;
		end
		return a
	end
	local m = {}
	m.__index = m
	-- Equivalent to R.puts(<str>) in RubyJS
	function m:puts()
		print(f)
		return m
	end
	if(type(f) == "table") then
	end
	if(type(f) == "string") then
		function m:w(separator)
			local t = {}
			for s in f:gmatch("[^"..separator.."]+") do
				t[#t+1] = s
			end
			return t
		end
	end
	return m
end

RubyLua = R