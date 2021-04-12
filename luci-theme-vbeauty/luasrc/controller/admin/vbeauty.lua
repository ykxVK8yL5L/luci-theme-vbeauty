module("luci.controller.admin.vbeauty", package.seeall)

function index()
    entry({"admin", "status"}, alias("admin", "status", "vbeauty"), _("Status"), 0).index = true
    entry({"admin", "status", "vbeauty"}, template("themes/vbeauty/vbeauty"), _("Vbeauty"), 0)
    entry({'admin', 'status', 'vbeauty', 'addfavourite'}, call('addfavourite'))
    entry({'admin', 'status', 'vbeauty', 'delfavourite'}, call('delfavourite'))
    entry({'admin', 'status', 'vbeauty', 'getfavourites'}, call('getfavourites'))
end

function addfavourite()
  local title = string.gsub(luci.http.formvalue("title"), "%s+", "")
  local src = luci.http.formvalue("src")
  local short = luci.http.formvalue("short")
  local bcolor = luci.http.formvalue("bcolor")
  local fcolor = luci.http.formvalue("fcolor")
  local name = os.time()
  --local uci = luci.model.uci.cursor()
  --uci:set('vbeauty', '@favourite.'..name, 'title', title)
  local executeString = "uci set vbeauty."..name.."=favourite"
  luci.sys.exec(executeString)

  local titleString = "uci set vbeauty."..name..".title="..title
  luci.sys.exec(titleString)

  local srcString = "uci set vbeauty."..name..".src="..src
  luci.sys.exec(srcString)

  local shortString = "uci set vbeauty."..name..".short="..short
  luci.sys.exec(shortString)

  local bcolorString = "uci set vbeauty."..name..".bcolor="..bcolor
  luci.sys.exec(bcolorString)

  local fcolorString = "uci set vbeauty."..name..".fcolor="..fcolor
  luci.sys.exec(fcolorString)


  luci.sys.exec("uci commit vbeauty");
  local o = {}
  o['data'] = "ok"
  o['msg'] = name
  luci.http.prepare_content("application/json")
  luci.http.write_json(o)
end

function getfavourites()
    local uci = luci.model.uci.cursor()
    local favourite_table = {}
    uci:foreach(
        'vbeauty',
        'favourite',
        function(s)
            local e = {}
            e['name'] = s['.name']
            e['title'] = s.title
            e['short'] = s.short
            e['src'] = s.src
            e['bcolor'] = s.bcolor
            e['fcolor'] = s.fcolor
            table.insert(favourite_table, e)
        end
    )
    luci.http.prepare_content('application/json')
    luci.http.write_json(favourite_table)
end




function delfavourite()
  local name = luci.http.formvalue("name")
  local executeString = "uci delete vbeauty."..name
  luci.sys.exec(executeString)
  luci.sys.exec("uci commit vbeauty");
  local o = {}
  o['data'] = "ok"
  luci.http.prepare_content("application/json")
  luci.http.write_json(o)
end

