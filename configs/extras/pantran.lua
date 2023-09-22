require("pantran").setup {
  -- Default engine to use for translation. To list valid engine names run
  default_engine = "google",
  fallback = {
    default_source = "auto",
    default_target = "vi",
  },
}
