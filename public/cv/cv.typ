//  #let color-dark = rgb("#131A28")
//  #let linkedin-icon = box(fa-icon("linkedin", fill: color-dark))
//  #let github-icon = box(fa-icon("github", fill: color-dark))
//  #let linkedin-icon = box(fa-icon("linkedin", fill: color-dark))
//  #let email-icon = box(fa-icon("envelope", fill: color-dark))
//  #let website-icon = box(fa-icon("globe", fill: color-dark))

// Helper Functions
#let monthname(n, display: "short") = {
    n = int(n)
    let month = ""

    if n == 1 { month = "January" }
    else if n == 3 { month = "March" }
    else if n == 2 { month = "February" }
    else if n == 4 { month = "April" }
    else if n == 5 { month = "May" }
    else if n == 6 { month = "June" }
    else if n == 7 { month = "July" }
    else if n == 8 { month = "August" }
    else if n == 9 { month = "September" }
    else if n == 10 { month = "October" }
    else if n == 11 { month = "November" }
    else if n == 12 { month = "December" }
    else { month = none }
    if month != none {
        if display == "short" {
            month = month.slice(0, 3)
        } else {
            month
        }
    }
    month
}

#let strpyear(isodate) = {
    let date = ""
    if lower(isodate) != "present" {
        let year = int(isodate.slice(0, 4))
        date = datetime(year: year)
        date = date.display("[year]")
    } else if lower(isodate) == "present" {
        date = "Present"
    }
    return date
}
#let strpdate(isodate) = {
    let date = ""
    if lower(isodate) != "present" {
        let year = int(isodate.slice(0, 4))
        let month = int(isodate.slice(5, 7))
        let day = int(isodate.slice(8, 10))
        let monthName = monthname(month, display: "short")
        date = datetime(year: year, month: month, day: day)
        date = monthName + " " + date.display("[year repr:full]")
    } else if lower(isodate) == "present" {
        date = "Present"
    }
    return date
}

#let daterange(start, end) = {
    if start != none and end != none [
        #start #sym.dash.en #end
    ]
    if start == none and end != none [
        #end
    ]
    if start != none and end == none [
        #start
    ]
}

// set rules
#let setrules(uservars, doc) = {
    set text(
        font: uservars.bodyfont,
        size: uservars.fontsize,
        hyphenate: false,
    )

    set list(
        spacing: uservars.linespacing
    )

    set par(
        leading: uservars.linespacing,
        justify: true,
    )

    doc
}

// show rules
#let showrules(uservars, doc) = {
    // Uppercase section headings
    show heading.where(
        level: 2,
    ): it => block(width: 100%)[
        #v(uservars.sectionspacing)
        #set align(left)
        #set text(font: uservars.headingfont, size: 1em, weight: "bold")
        #if (uservars.at("headingsmallcaps", default:false)) {
            smallcaps(it.body)
        } else {
            upper(it.body)
        }
        #v(-0.75em) #line(length: 100%, stroke: 1pt + black) // draw a line
    ]

    // Name title/heading
    show heading.where(
        level: 1,
    ): it => block(width: 100%)[
        #set text(font: uservars.headingfont, size: 1.5em, weight: "bold")
        #if (uservars.at("headingsmallcaps", default:false)) {
            smallcaps(it.body)
        } else {
            upper(it.body)
        }
        #v(2pt)
    ]

    doc
}

// Set page layout
#let cvinit(doc) = {
    doc = setrules(doc)
    doc = showrules(doc)

    doc
}

// Job titles
#let jobtitletext(info, uservars) = {
    if ("titles" in info.personal and info.personal.titles != none) and uservars.showTitle {
        block(width: 100%)[
            *#info.personal.titles.join("  /  ")*
            #v(-4pt)
        ]
    } else {none}
}

// Address
#let addresstext(info, uservars) = {
    if ("location" in info.personal and info.personal.location != none) and uservars.showAddress {
        // Filter out empty address fields
        let address = info.personal.location.pairs().filter(it => it.at(1) != none and str(it.at(1)) != "")
        // Join non-empty address fields with commas
        let location = address.map(it => str(it.at(1))).join(", ")

        block(width: 100%)[
            #location
            #v(-4pt)
        ]
    } else {none}
}

#let contacttext(info, uservars) = block(width: 100%)[
    #let profiles = (
        if "email" in info.personal and info.personal.email != none { box(link("mailto:" + info.personal.email)) },
        if ("phone" in info.personal and info.personal.phone != none) and uservars.showNumber {box(link("tel:" + info.personal.phone))} else {none},
        if ("url" in info.personal) and (info.personal.url != none) {
            box(link(info.personal.url)[#info.personal.url.split("//").at(1)])
        }
    ).filter(it => it != none) // Filter out none elements from the profile array

    #if ("profiles" in info.personal) and (info.personal.profiles.len() > 0) {
        for profile in info.personal.profiles {
            profiles.push(
                box(link(profile.url)[#profile.url.split("//").at(1)])
            )
        }
    }

    #set text(font: uservars.bodyfont, weight: "medium", size: uservars.fontsize * 1)
    #pad(x: 0em)[
        #profiles.join([#sym.space.en #sym.diamond.filled #sym.space.en])
    ]
]

#let cvheading(info, uservars) = {
    align(center)[
        = #info.personal.name
        #jobtitletext(info, uservars)
        #addresstext(info, uservars)
        #contacttext(info, uservars)
    ]
}

#let section(title: "Section", isbreakable: true, body) = {
    block[#{
        heading(title, level:2)
        block(width: 100%, breakable: isbreakable)[
            #body
        ]
        }]
}

#let endnote(uservars) = {
  if uservars.sendnote {
    place(
        bottom + right,
        dx: 9em,
        dy: -7em,
        rotate(-90deg, block[
            #set text(size: 4pt, font: "IBM Plex Mono", fill: silver)
            \*This document was last updated on #datetime.today().display("[year]-[month]-[day]") using #underline(link("https://typst.app/home")[*Typst*]). \
        ])
    )
  } else {
    place(
        bottom + right,
        block[
            #set text(size: 5pt, font: "DejaVu Sans Mono", fill: silver)
            \*This document was last updated on #datetime.today().display("[year]-[month]-[day]") using #underline(link("https://typst.app/home")[*Typst*]). \
        ]
    )
  }
}

#let cvdata = yaml("template.yml")

#let uservars = (
    headingfont: "EB Garamond",
    bodyfont: "TeX Gyre Bonum",
    fontsize: 12pt,          // https://typst.app/docs/reference/layout/length
    linespacing: 7pt,        // length
    sectionspacing: 0pt,     // length
    showAddress:  true,      // https://typst.app/docs/reference/foundations/bool
    showNumber: true,        // bool
    showTitle: true,         // bool
    headingsmallcaps: false, // bool
    sendnote: false,         // bool. set to false to have sideways endnote
)


#let customrules(doc) = {
    // add custom document style rules here
    set page(                 // https://typst.app/docs/reference/layout/page
        paper: "a4",
        numbering: "1 / 1",
        number-align: center,
        margin: 1.25cm,
    )

    // set list(indent: 1em)

    doc
}

#let cvinit(doc) = {
    doc = setrules(uservars, doc)
    doc = showrules(uservars, doc)
    doc = customrules(doc)

    doc
}


#show: doc => cvinit(doc)

#cvheading(cvdata, uservars)

== RESEARCH INTERESTS
- Spectral Theory, Quantum Graphs, Operator Theory, Mathematical Physics.

- Coding Theory, Combinatorics

- Combinatorial Number Theory, Algebraic Number Theory

== Education
*Stockholm University / KTH Royal Institute of Technology* #h(1fr) 
*Stockholm, Sweden*\
#text()[_Master in Mathematics_]#h(1fr) 
 Sep 2023 -- Present
- *Courses*: Advanced Real Analysis, Type Theory, Algebraic Geometry

- *Activities*: Gave a seminar talk on formal philosophy. 

=== Master Thesis: "Berry Phase for Quantum Graphs"
- Supervisor: *Pavel Kurasov*
*Contributions*:
- Studied _topology change_ via parameter-dependent vertex conditions.
- Derived explicit continuous eigenfunction families.
- Showed that topology change induces _a nontrivial Berry phase $pi$_ for real-valued eigenfunctions.
- Established a connection between topology change and the structure of operator domains.

#line(length: 60%, stroke: (thickness: 0.5pt))

*Petrozavodsk University* #h(1fr) 
*Petrozavodsk, Russia*\
#text()[_Bachelor in Mathematics_]#h(1fr) 
#daterange("Sep 2019", "Aug 2023")
- *Courses*: Applied Statistics, Actuarial Mathematics, Finance Mathematics, Random Processes
- *Activities*: Worked as a teacher assistant and popular lecturer with Vladimir Kuznetsov.
=== Bachelor Thesis: "Bernstein Polynomials and MacWilliams Transform"
- Supervisor: *Nikita Gogin*, *Vladimir Kuznetsov*
*Contributions*:
- Studied MacWilliams (Krawtchouk) transform and its applications in approximation theory. 
- Found new formulae for Bernstein and Chebyshev polynomials.
- Developed an algorithm for computing Bernstein polynomials.

#section(title: "Teaching Experience")[
_*Teacher Assistant*_ #h(1fr) _2021-2023_
- *Activities:* Conducting exams, creating learning materials, and giving lectures in computer science and mathematics.

*_Private Teacher_* #h(1fr) _2017-2021_
- *Activities:* Private teaching on Programming in C/C++ and Python.

]
#section(title: "Publications")[
1. Vladislav Shubin. "Investigation of $phi$-radical numbers". In: 73rd Scientific Conference of Students and Young Scientist. Petrozavodsk, 2021. 

2. Vladislav Shubin and Nikita Gogin. #link("https://pca-pdmi.ru/2023/files/17/Gogin-Shubin-2023.pdf")["Bernstein Polynomials and MacWilliams transform"]. In: Polynomial Computer Algebra, 2023. 

3. Vladislav Shubin and Nikita Gogin. #link("https://pca-pdmi.ru/2024/files/48/prime.pdf")["Binomial Coefficients as Functions of their Denominator; Another Primality Criteria for Natural Integers"]. Polynomial Computer Algebra, 2024. 

4. Vladislav Shubin and Nikita Gogin. #link("https://pca.conf-pdmi.ru/2025/files/63/GoginShubin.pdf")["Prime Power Conjecture for Projective Planes"]. Polynomial Computer Algebra, 2025. 

=== #link("https://oeis.org")[OEIS] contributions 

I authored the following #link("https://oeis.org")[OEIS] sequences: 
#link("https://oeis.org/A355045")[A355045], #link("https://oeis.org/A355059")[A355059], #link("https://oeis.org/A337775")[A337775], #link("https://oeis.org/A337776")[A337776], and also contributed to #link("https://oeis.org/A000108")[A000108]
]

== Skills, Languages, Interests
- *Math Skills*:
    - Quantum Graphs, Spectral Theory, Functional Analysis
    - Coding Theory, Combinatorics
- *Programming Skills*:
    - Typst & LaTeX
    - Lean
    - Python
    - C/C++ & Rust
- *Languages*: English (B2), Russian (native)
- *Interests*: 
    - Classical guitar (7-year formal training)
    - Formal philosophy (coursework at Higher School of Economics)
    - Programming (C/C++, Linux systems)

#endnote(uservars)
