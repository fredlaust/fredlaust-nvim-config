return {
	s(
		{
			trig = "conf",
			snippetType = "snippet",
			desc = "Basic setup for conf doc w/ code snippets",
			trigEngine = "plain",
		},
		t({
			"#let conf(doc, doctitle: []) = {",

			"  // SET RULES //////////////////",

			'  set heading(numbering: "1.1")',
			"  set document(",
			"    title: doctitle,",
			'     author: "Frederik L. K. Nørregaard",',
			"    keywords: (),",
			"  )",

			"  // SHOW RULES /////////////////",

			"  //Page setup",
			"  set page(",
			'    paper: "a4",',
			"    header: align(right, context document.title),",
			'    numbering: "1",',
			"  )",
			"  title()",
			"  doc",
			"}",
			"",
			"// Code snippets as figures",
			'#let code_snippet(lang: "", code: "", caption: none, label: none) = {',
			"  let fig = figure(",
			"    align(left, block(fill: luma(240), inset: 8pt, radius: 4pt, width: 100%, raw(lang: lang, block: true, code))),",
			"    caption: if caption != none { caption },",
			'	  supplement: "Listing",',
			"    kind: raw,",
			"  )",
			"  if label != none {",
			"// Aligner caption",
			"// show figure.where(kind: raw): it => {",
			"//   it.body",
			"//   align(left, it.caption)",
			"// }",
			"    [#fig#label]",
			"  } else {",
			"    fig",
			"  }",
			"}",
		})
	),

	s(
		{
			trig = "main",
			snippetType = "snippet",
			desc = "Basic setup for blank 1 file report",
			trigEngine = "plain",
		},
		t({
			"#let doctitle = []",
			' #import "conf.typ": code_snippet, conf',
			"",
			"// Show rules",
			"#show: conf.with(doctitle: doctitle)",
			"",
			"// Set rules",
			"#set linebreak(justify: false)",
			"",
			"#grid(",
			"  columns: (auto, auto),",
			"  align: left,",
			"  column-gutter: 1em,",
			"  gutter: 8pt,",
			"  [Author:], [*FREDERIK LAUST KIRCHHOFF NØRREGAARD* #linebreak()],",
			"  [Email:], [*#link()*#linebreak()],",
			")",
			"",
			"#show link: underline",
			" Link to online repository: ",
			"",
			"= Introduction",
		})
	),
local s = parse

return {
    s(
        { trig = 'conf-bib-basic', snippetType = 'snippet', desc = 'Basic conf for bib files' },
        [[
#let conf(doc, doctitle: [], show_bib: false) = {
  //Set rules
  set heading(numbering: "1.1")
  set document(title: doctitle)
  set par(justify: true, linebreaks: "optimized")
  //show rules
  // Goer saa en section reference ogsaa har title.
  // https://github.com/typst/typst/discussions/2656
  // Claude har rettet til saa det ikke viser dobbelt section navn
  show ref: r => {
    if r.element != none and r.element.func() == heading {
      let num = numbering(r.element.numbering, ..counter(heading).at(r.element.location()))
      link(r.element.location())[#num #emph(r.element.body)]
    } else {
      r
    }
  }
  //Page setup
  set page(
    paper: "a4",
    header: align(right, context document.title),
    numbering: "1", // Hvordan sidetal vises
  )
  doc
}
/*
Funktion til at kunne se individuelle sider hvor kilder virker, uden vi behoever at kalde #bib i hvert doku, samtidig med at main kan compile.
https://forum.typst.app/t/how-to-share-bibliography-in-a-multi-file-setup/1605/9
*/
#let load-bib(main: false) = {
  counter("bibs").step()
  context if main {
    [#bibliography("zotero.bib") <main-bib>]
  } else if query(<main-bib>) == () and counter("bibs").get().first() == 1 {
    // This is the first bibliography, and there is no main bibliography
    show bibliography: none
    bibliography("zotero.bib")
  }
}
#let citepage(source: label, page: []) = {
  cite(source, style: "ieee", supplement: page)
}
$0]]
    ),

    s(
        { trig = 'conf-math-assignment', snippetType = 'snippet', desc = 'Basic conf for math assignment files' },
        [[
#let conf(doc, assignment_number: []) = {

  let assgn_name = [Assignment #assignment_number]

  //Set rules
  set heading(numbering: "1.1")
  set document(title: assignment_name)
  set par(justify: true, linebreaks: "optimized")

  //show rules

  //Page setup
  set page(
    paper: "a4",
    header: align(right, assgn_name),
    numbering: "1", 
  )
  doc
}
    $0]]
    ),
}
