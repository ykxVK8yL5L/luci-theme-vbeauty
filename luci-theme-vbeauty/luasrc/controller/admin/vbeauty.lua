module("luci.controller.admin.vbeauty", package.seeall)

function index()
  if not nixio.fs.access("/etc/config/vbeauty") then return end
  if nixio.fs.access("/etc/config/vbeauty_show") then
    entry({"admin", "status"}, alias("admin", "status", "vbeauty"), _("Status"), 0).index = true
    entry({"admin", "status", "vbeauty"}, template("themes/vbeauty/vbeauty"), _("Vbeauty"), 0)
  else
    entry({"admin", "status"}, alias("admin", "status", "overview"), _("Status"), 20).index = true
    entry({"admin", "status", "vbeauty"}, template("themes/vbeauty/vbeauty"), _("Vbeauty"), 60)
  end
    entry({"admin", "status", "vzant", "show"}, call("show_menu")).leaf = true
    entry({"admin", "status", "vzant", "hide"}, call("hide_menu")).leaf = true
    entry({'admin', 'status', 'vbeauty', 'addfavourite'}, call('addfavourite'))
    entry({'admin', 'status', 'vbeauty', 'delfavourite'}, call('delfavourite'))
    entry({'admin', 'status', 'vbeauty', 'getfavourites'}, call('getfavourites'))
end



function show_menu()
  luci.sys.call("touch /etc/config/vbeauty_show")
  luci.http.redirect(luci.dispatcher.build_url("admin", "status", "vbeauty"))
end

function hide_menu()
  luci.sys.call("rm -rf /etc/config/vbeauty_show")
  luci.http.redirect(luci.dispatcher.build_url("admin", "status", "overview"))
end



function addfavourite()
  local title = luci.http.formvalue("title")
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

