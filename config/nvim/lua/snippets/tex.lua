local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- This helper allows us to define "autosnippets"
local as = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

return {
  -- --- MANUAL SNIPPETS (Type word + TAB) ---

  -- Equation block
  s("beq", {
    t({ "\\begin{equation}", "\t" }),
    i(1),
    t({ "", "\\end{equation}" }),
  }),

  -- Bra-ket
  s("bk", {
    t("\\braket{"),
    i(1),
    t("}"),
  }),

  -- General Table
  s("table", {
    t({ "\\begin{table}[h]", "\t\\centering", "\t\\begin{tabular}{" }),
    i(1, "|c|c|"),
    t({ "}", "\t\t\\hline", "\t\t" }),
    i(2, "Data & Data"),
    t({ " \\\\", "\t\t\\hline", "\t\\end{tabular}", "\t\\caption{" }),
    i(3, "Caption"),
    t({ "}", "\t\\label{tab:" }),
    i(4, "label"),
    t({ "}", "\\end{table}" }),
  }),

  -- --- AUTOSNIPPETS (Instant trigger) ---

  -- Type // for a fraction
  as("//", {
    t("\\frac{"),
    i(1, "num"),
    t("}{"),
    i(2, "den"),
    t("}"),
  }),

  -- 2x2 Matrix
  as("mat2", {
    t({ "\\begin{pmatrix}", "\t" }),
    i(1, "a11"),
    t(" & "),
    i(2, "a12"),
    t({ " \\\\", "\t" }),
    i(3, "a21"),
    t(" & "),
    i(4, "a22"),
    t({ " \\\\", "\\end{pmatrix}" }),
  }),

  -- 3x3 Matrix
  as("mat3", {
    t({ "\\begin{pmatrix}", "\t" }),
    i(1, "a11"),
    t(" & "),
    i(2, "a12"),
    t(" & "),
    i(3, "a13"),
    t({ " \\\\", "\t" }),
    i(4, "a21"),
    t(" & "),
    i(5, "a22"),
    t(" & "),
    i(6, "a23"),
    t({ " \\\\", "\t" }),
    i(7, "a31"),
    t(" & "),
    i(8, "a32"),
    t(" & "),
    i(9, "a33"),
    t({ " \\\\", "\\end{pmatrix}" }),
  }),

  -- Fast Greek
  as(";a", t("\\alpha")),
  as(";b", t("\\beta")),
  as(";g", t("\\gamma")),
  as(";l", t("\\lambda")),
  as(";r", t("\\rho")),
  as(";s", t("\\sigma")),
  as(";S", t("\\Sigma")),
  as(";o", t("\\omega")),
  as(";O", t("\\Omega")),

  -- Type mk for inline math $ $
  as("mk", {
    t("$"),
    i(1),
    t("$"),
  }),
}
