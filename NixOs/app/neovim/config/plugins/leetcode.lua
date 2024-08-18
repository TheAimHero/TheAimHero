require("leetcode").setup({
  arg = "leet",
  lang = "cpp",
  injector = {
    ["cpp"] = {
      before = { "#include <bits/stdc++.h>", "using namespace std;" },
      after = "int main() {}",
    },
  },

})
