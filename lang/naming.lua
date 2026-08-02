-- The naming screen's letter grid.  Return an empty table to keep the
-- English alphabet.
--
-- Each entry is a row of cells; a cell is whatever sequence your charmap
-- maps, so a multi-byte character is one cell.  The row holding a single
-- "lower case" / "UPPER CASE" cell is the case switch, and the cell
-- spelled "ED" is the confirm.
return {
  upper = {
    { "A", "B", "C", "D", "E", "F", "G", "H", "I" },
    { "J", "K", "L", "M", "N", "O", "P", "Q", "R" },
    { "S", "T", "U", "V", "W", "X", "Y", "Z", " " },
    { "×", "(", ")", ":", ";", "[", "]", "<PK>", "<MN>" },
    { "-", "?", "!", "♂", "♀", "/", ".", ",", "Ya" },
    { "minúsculas" },
  },
  lower = {
    { "a", "b", "c", "d", "e", "f", "g", "h", "i" },
    { "j", "k", "l", "m", "n", "o", "p", "q", "r" },
    { "s", "t", "u", "v", "w", "x", "y", "z", " " },
    { "×", "(", ")", ":", ";", "[", "]", "<PK>", "<MN>" },
    { "-", "?", "!", "♂", "♀", "/", ".", ",", "Ya" },
    { "MAYÚSCULAS" },
  },
}
