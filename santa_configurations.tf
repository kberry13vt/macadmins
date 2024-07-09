resource "zentral_santa_configuration" "default" {
  name           = "Default"
  client_mode    = "MONITOR"
  enable_bundles = true
}

resource "zentral_santa_enrollment" "default" {
  configuration_id      = zentral_santa_configuration.default.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}

resource "zentral_santa_rule" "teamid-macpaw" {
  configuration_id  = zentral_santa_configuration.default.id
  policy            = "BLOCKLIST"
  target_type       = "TEAMID"
  target_identifier = "S8EX82NJP6"
  custom_message    = "No MacPaw apps are allowed!!!"
  description       = "Block MacPaw apps, mostly for demo purposes"
}

