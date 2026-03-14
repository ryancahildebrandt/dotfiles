[ nu_plugin_inc
  nu_plugin_polars
  nu_plugin_gstat
  nu_plugin_formats
  nu_plugin_query
  nu_plugin_highlight
  nu_plugin_regex
] | each { cargo install $in } | ignore
