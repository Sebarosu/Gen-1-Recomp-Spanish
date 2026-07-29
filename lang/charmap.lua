-- Which byte sequence draws which glyph code.
--
-- Sequences are matched longest-first, so a multi-byte character and a
-- multi-character ligature both work: "ch" can be one glyph even though
-- "c" is also mapped.  Codes here must land inside a page declared in
-- lang/font.lua.
return {
  ["~"] = 0x100,
  ["ª"] = 0x101,
  ["º"] = 0x102,
  ["Á"] = 0x103,
  ["É"] = 0x104,
  ["Í"] = 0x105,
  ["Ñ"] = 0x106,
  ["Ó"] = 0x107,
  ["Ú"] = 0x108,
  ["Ü"] = 0x109,
  ["á"] = 0x10A,
  ["í"] = 0x10B,
  ["ñ"] = 0x10C,
  ["ó"] = 0x10D,
  ["ú"] = 0x10E,
  ["ü"] = 0x10F,
  ["¿"] = 0x110,
  ["¡"] = 0x111,
}
