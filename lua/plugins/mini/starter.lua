return function(mini) 
  return {
    evaluate_single = true,
    items = {
      mini.sections.recent_files(5, true),
      mini.sections.telescope(),
      mini.sections.recent_files(2, false),
      -- Use this if you set up 'mini.sessions'
      mini.sections.sessions(5, true),
      mini.sections.builtin_actions(),
    },
    content_hooks = {
      -- mini.starter").gen_hook.adding_bullet("▓"),
      mini.gen_hook.adding_bullet(require("noiz.utils.const").syms["47"] .. " "),
      mini.gen_hook.indexing("section", { "Builtin actions" }),
      mini.gen_hook.aligning("center", "center"),
    }
  }
end
