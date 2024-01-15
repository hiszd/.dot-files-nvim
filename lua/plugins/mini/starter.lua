return {
  evaluate_single = true,
  items = {
    require("mini.starter").sections.recent_files(5, true),
    require("mini.starter").sections.telescope(),
    require("mini.starter").sections.recent_files(2, false),
    -- Use this if you set up 'mini.sessions'
    require("mini.starter").sections.sessions(5, true),
    require("mini.starter").sections.builtin_actions(),
  },
  content_hooks = {
    -- require("mini.starter").gen_hook.adding_bullet("▓"),
    require("mini.starter").gen_hook.adding_bullet(require("noiz.utils.const").syms["47"] .. " "),
    require("mini.starter").gen_hook.indexing("section", { "Builtin actions" }),
    require("mini.starter").gen_hook.aligning("center", "center"),
  }
}
