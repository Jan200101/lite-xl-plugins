-- lite-xl 1.16
local syntax = require "core.syntax"


local liquid_syntax = {
  patterns = {
    { pattern = { '"', '"', '\\' },        type = "string"   },
    { pattern = { "'", "'", '\\' },        type = "string"   },
    { pattern = "-?%d+[%d%.]*f?",          type = "number"   },
    { pattern = "-?%.?%d+f?",              type = "number"   },
    { pattern = "%w+",                     type = "symbol" },
  },
  symbols = {
    ["abs"] = "keyword2",
    ["and"] = "operator",
    ["append"] = "keyword2",
    ["assign"] = "keyword",
    ["at_least"] = "keyword2",
    ["at_most"] = "keyword2",
    ["break"] = "keyword",
    ["camelcase"] = "keyword2",
    ["capitalize"] = "keyword2",
    ["capture"] = "keyword",
    ["endcapture"] = "keyword",
    ["case"] = "keyword",
    ["ceil"] = "keyword2",
    ["comment"] = "keyword",
    ["endcomment"] = "keyword",
    ["concat"] = "keyword2",
    ["contains"] = "operator",
    ["cycle"] = "keyword",
    ["date"] = "keyword2",
    ["decrement"] = "keyword",
    ["default"] = "keyword2",
    ["divided_by"] = "keyword2",
    ["downcase"] = "keyword2",
    ["else"] = "keyword",
    ["elsif"] = "keyword",
    ["false"] = "literal",
    ["first"] = "keyword2",
    ["floor"] = "keyword2",
    ["for"] = "keyword",
    ["endfor"] = "keyword",
    ["forloop"] = "literal",
    ["handleize"] = "keyword2",
    ["handle"] = "keyword2",
    ["if"] = "keyword",
    ["endif"] = "keyword",
    ["increment"] = "keyword",
    ["index0"] = "literal",
    ["index"] = "literal",
    ["in"] = "operator",
    ["join"] = "keyword2",
    ["last"] = "keyword2",
    ["length"] = "literal",
    ["limit"] = "keyword",
    ["lstrip"] = "keyword",
    ["map"] = "keyword2",
    ["minus"] = "keyword2",
    ["modulo"] = "keyword2",
    ["nil"] = "literal"
    ["null"] = "literal",
    ["offset"] = "keyword2",
    ["or"] = "operator",
    ["pluralize"] = "keyword2",
    ["plus"] = "keyword2",
    ["prepend"] = "keyword2",
    ["raw"] = "keyword",
    ["endraw"] = "keyword",
    ["removefirst"] = "keyword2",
    ["remove"] = "keyword2",
    ["replacefirst"] = "keyword2",
    ["replace"] = "keyword2",
    ["reversed"] = "operator",
    ["reverse"] = "keyword2",
    ["rindex0"] = "literal",
    ["rindex"] = "literal",
    ["round"] = "keyword2",
    ["rstrip"] = "keyword2",
    ["size"] = "keyword2",
    ["slice"] = "keyword2",
    ["sort"] = "keyword2",
    ["split"] = "keyword2",
    ["strip"] = "keyword2",
    ["strip_newlines"] = "keyword2",
    ["times"] = "keyword2",
    ["true"] = "literal",
    ["truncate"] = "keyword2",
    ["truncatewords"] = "keyword2",
    ["uniq"] = "keyword2",
    ["unless"] = "keyword",
    ["endunless"] = "keyword",
    ["upcase"] = "keyword2",
    ["when"] = "keyword",
    ["where"] = "keyword2"
    
  },
}

syntax.add {
  files = { "%.liquid?$" },
  patterns = {
    { pattern = { "{%%", "%%}" }, syntax = liquid_syntax, type = "function" },
    { pattern = { "{{", "}}" }, syntax = liquid_syntax, type = "function" },
    { 
      pattern = { 
        "<%s*[sS][cC][rR][iI][pP][tT]%s+[tT][yY][pP][eE]%s*=%s*" ..
          "['\"]%a+/[jJ][aA][vV][aA][sS][cC][rR][iI][pP][tT]['\"]%s*>",
        "<%s*/[sS][cC][rR][iI][pP][tT]>" 
      },
      syntax = ".js", 
      type = "function" 
    },
    { 
      pattern = { 
        "<%s*[sS][cC][rR][iI][pP][tT]%s*>",
        "<%s*/%s*[sS][cC][rR][iI][pP][tT]>" 
      },
      syntax = ".js",
      type = "function"
    },
    { 
      pattern = { 
        "<%s*[sS][tT][yY][lL][eE][^>]*>", 
        "<%s*/%s*[sS][tT][yY][lL][eE]%s*>" 
      },
      syntax = ".css",
      type = "function"
    },
    { pattern = { "<!%-%-", "%-%->" },     type = "comment"  },
    { pattern = { '%f[^>][^<]', '%f[<]' }, type = "normal"   },
    { pattern = { '"', '"', '\\' },        type = "string"   },
    { pattern = { "'", "'", '\\' },        type = "string"   },
    { pattern = "0x[%da-fA-F]+",           type = "number"   },
    { pattern = "-?%d+[%d%.]*f?",          type = "number"   },
    { pattern = "-?%.?%d+f?",              type = "number"   },
    { pattern = "%f[^<]![%a_][%w_]*",      type = "keyword2" },
    { pattern = "%f[^<][%a_][%w_]*",       type = "function" },
    { pattern = "%f[^<]/[%a_][%w_]*",      type = "function" },
    { pattern = "[%a_][%w_]*",             type = "keyword"  },
    { pattern = "[/<>=]",                  type = "operator" }
  },
  symbols = {},
}
