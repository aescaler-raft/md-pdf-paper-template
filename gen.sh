#!/usr/bin/env bash
# @File:     gen.sh
# @Created:  2019-10-23 10:22:52
# @Modified: 2019-12-03 03:09:26
# @OA:       Antonio Escalera
# @CA:       aescalera
# @Mail:     aj@aod.sh
# @Copy:     Copyright © 2019 Antonio Escalera <aj@aod.sh>
# @Require: pandoc texlive
# @Usage: $0 [pdf|tex]

PAPER="${PAPER:-CHANGEME}"

PANDOC_CO="${PANDOC_CO:-classoption=onecolumn}"
PANDOC_FILTER="${PANDOC_FILTER:---citeproc}"
PANDOC_PS="${PANDOC_PS:-papersize=a4paper}"

# generates a pdf document
pdf() {
	pandoc \
  "${PANDOC_FILTER}" \
	--bibliography="${PAPER}.bib" \
  --variable "${PANDOC_CO}" \
	--variable "${PANDOC_PS}" \
	-s "${PAPER}.md" \
	-o "${PAPER}.pdf"
}
# --filter $FILTER \

# generates a LaTeX document
tex() {
	pandoc \
	--filter "${PANDOC_FILTER}" \
	--bibliography="${PAPER}.bib" \
	--variable "${PANDOC_CO}" \
	--variable "${PANDOC_PS}" \
	-s "${PAPER}.md" \
	-o "${PAPER}.tex"
}

$@
