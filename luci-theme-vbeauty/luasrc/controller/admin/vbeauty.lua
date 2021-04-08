module("luci.controller.admin.vbeauty", package.seeall)

function index()
    entry({"admin", "status"}, alias("admin", "status", "vbeauty"), _("Status"), 0).index = true
    entry({"admin", "status", "vbeauty"}, template("vbeauty"), _("Vbeauty"), 0)
end
