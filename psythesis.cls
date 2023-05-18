\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{psythesis}[Document class for BNU thesis in psychology.]
\LoadClass[12pt, a4paper, fontset=none]{ctexart}

% Geometry 页面设置
\RequirePackage{geometry}
\geometry{
	paper = a4paper,
	top = 2.5cm,
	bottom = 1.95cm,
	left = 2.5cm,
	right = 2.0cm,
	% headheight = 15pt,
	footskip = 0.95cm,
	% headsep = 1.2cm,
}

% Spacing 间距
\linespread{1.39}
\setlength{\parskip}{0pt plus 2pt}

% Text fonts 正文字体设置
\input{en-fontset.tex}
\input{zh-fontset.tex}

% Math fonts 数学字体设置
\RequirePackage{amsmath, amsfonts, stmaryrd, amssymb, amsbsy, cancel}
\allowdisplaybreaks
\RequirePackage[
    mathit = sym,
    mathup = sym,
    mathbf = sym,
    math-style = TeX,
    bold-style = ISO,
]{unicode-math}
\input{math-fontset.tex}

% Section formats 章节格式
\ctexset{
    section = {
        number = {\arabic{section}},
        format = {\zihao{3}\bfseries},
        nameformat = {},
        aftername = {\hspace*{1em}},
        titleformat = {\sffamily},
        beforeskip = 0em, % 由于分页，Word段首距离不生效
        afterskip = 0.5em plus 1.5pt minus 1.5pt,
        break = {\clearpage},
    },
    subsection = {
        number = {\arabic{section}.\arabic{subsection}},
        format = {\zihao{-3}\bfseries},
        nameformat = {},
        aftername = {\hspace*{0.5em}},
        titleformat = {\sffamily},
        beforeskip = 0.5em plus 1.5pt minus 1.5pt,
        afterskip = 0.5em plus 1.5pt minus 1.5pt,
    },
    subsubsection = {
        number = {\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
        format = {\zihao{4}\bfseries},
        nameformat = {},
        aftername = {\hspace*{0.5em}},
        titleformat = {\sffamily},
        beforeskip = 0.5em plus 1.5pt minus 1.5pt,
        afterskip = 0.5em plus 1.5pt minus 1.5pt,
    },
}

% Headings and footings 页眉与页脚
\RequirePackage{fancyhdr}
\fancypagestyle{general}{
    \fancyhead{}
    \fancyfoot{\centering\thepage}
    \renewcommand\headrulewidth{0pt}
}
\pagestyle{general}

% Title page 标题页
\RequirePackage[absolute, overlay]{textpos}
\setlength{\TPHorizModule}{\paperwidth}
\setlength{\TPVertModule}{\paperheight}
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \begin{textblock}{0.7}(0.2695, 0.113)
        \noindent\includegraphics[width=7.9cm]{bnu.jpg}
    \end{textblock}

    \vspace*{3.1cm}
    
    {\noindent\CJKfamily{semiboldsong}\zihao{-0} \hfill 本\hspace{6pt}科\hspace{6pt}生\hspace{6pt}毕\hspace{6pt}业\hspace{6pt}论\hspace{6pt}文（设\hspace{6pt}计）\hfill}
    
    \vspace*{2.67cm}

    {\noindent\hspace*{0.5cm}\bfseries\sffamily\zihao{3} 毕业论文（设计）题目：}

    \vspace*{12pt}

    {\noindent\begin{minipage}{\textwidth}
        \centering
        \uline{\CJKfamily{semiboldsong}\zihao{3} \@title}
    \end{minipage}}

    \clearpage
    
    \thispagestyle{empty}
    \null\clearpage
}

% Abstract 摘要
\RequirePackage{ifoddpage}
\newcommand{\psythesis@oddnewpage}{
    \checkoddpage
    \ifoddpage
        \clearpage
        
        \null\clearpage
    \else
        \clearpage
    \fi
}
\newcommand{\psythesis@evennewpage}{
    \checkoddpage
    \ifoddpage
        \clearpage
    \else
        \clearpage
            
        \null\clearpage
    \fi
}
\newcommand{\zhabstract}[3][empty]{
    \pagestyle{#1}
    \noindent\begin{minipage}{\textwidth}
        \centering
        {\sffamily\bfseries\zihao{3}\@title}
    \end{minipage}
        
    {
        \ctexset{section = {
            break = {},
            beforeskip = 17pt,
            afterskip = 20pt,
            titleformat = {\centering\bfseries\sffamily\zihao{-3}}
        }}
        
        \section*{摘\hspace*{0.8em}要}
        \bookmark[dest=\HyperLocalCurrentHref, level=1]{摘要}
    }

    {\fontsize{14pt}{20pt}\selectfont #2}
    
    \vspace*{20pt}

    {\zihao{4}{\sffamily\bfseries 关键词：}#3}
    
    \psythesis@oddnewpage
    \pagestyle{general}
}
\newcommand{\enabstract}[4][empty]{
    \pagestyle{#1}
    \noindent\begin{minipage}{\textwidth}
        \centering
        {\rmfamily\bfseries\fontsize{16pt}{20pt}\selectfont \MakeUppercase{#2}}
    \end{minipage}  
    
    {
        \ctexset{section = {
            break = {},
            beforeskip = 27pt,
            afterskip = 20pt,
            titleformat = {\centering\bfseries\rmfamily\zihao{-3}}
        }}
        
        \section*{ABSTRACT}
        \bookmark[dest=\HyperLocalCurrentHref, level=1]{ABSTRACT}
    }
    
    {\rmfamily\upshape\fontsize{14pt}{\baselineskip}\selectfont%
     \setlength{\baselineskip}{20pt}#3\par}
    
    \vspace*{20pt}

    {\zihao{4}\textbf{KEY WORDS: }#4}
    
    \psythesis@oddnewpage
    \pagestyle{general}
}

% Table of contents 目录
\RequirePackage[titles]{tocloft}
\renewcommand\cftdot{$\cdot$}
\renewcommand\cftsecdotsep{\cftdotsep}
\renewcommand\cftsecleader{\cftdotfill{\cftsecdotsep}}
\setlength{\cftbeforesecskip}{0em}
\newcommand{\PSYtableofcontents}{
    \pagestyle{empty}
    {
        \ctexset{section = {
            break = {},
            beforeskip = 1em,
            afterskip = 1em,
            format = {\centering\zihao{3}\bfseries\sffamily},
            aftertitle = {\bookmark[dest=\HyperLocalCurrentHref, level=1]{目录}}
        }}
        \renewcommand*{\contentsname}{目\hspace*{1em}录}

        \tableofcontents
    }

    \psythesis@oddnewpage
    \setcounter{page}{1}
    \pagestyle{general}
}

% References 参考文献
\RequirePackage{csquotes, url}
\RequirePackage[style=apa, backend=biber]{biblatex}
\AtBeginDocument{\ctexset{bibname = {参考文献}}}
\setlength{\bibhang}{2em}
\AtBeginBibliography{
    \addcontentsline{toc}{section}{参考文献}
    \fontsize{10.5pt}{\baselineskip}\selectfont
    \setlength{\baselineskip}{16pt}
}
\newcommand{\zhreferences}{
    \psythesis@oddnewpage
    {
        \ctexset{section = {
            break = {},
            beforeskip = 10pt,
            afterskip = 10pt,
            format = {\centering\zihao{3}\bfseries\sffamily}
        }}
    
        \nocite{*}\printbibliography
    }
}

% Appendices 附录
\newcommand{\PSYappendix}{
    \psythesis@oddnewpage
    \appendix
    \ctexset{section = {
        name = {附录,},
        number = {\Alph{section}},
        beforeskip = 10pt,
        afterskip = 10pt,
        format = {\centering\zihao{3}\bfseries},
        break = {\psythesis@evennewpage},
    }}
}

% Listings 列表
\RequirePackage{enumerate, enumitem, listings}
\setenumerate[1]{labelsep=0.65em, leftmargin=3.65em, itemsep=2.2pt, topsep=2.5pt}
\setitemize[1]{labelsep=0.65em, leftmargin=3.65em, itemsep=2.2pt, topsep=2.5pt}

% 图片与表格
\RequirePackage{caption}
\DeclareCaptionFormat{psythesis}{\fontsize{10.5pt}{12.6pt}\selectfont\textbf{#1#2}#3}
\captionsetup{labelsep=quad, format=psythesis}
\setlength{\abovecaptionskip}{4pt plus 1pt}
\setlength{\belowcaptionskip}{-10.5pt plus 1pt}

% Miscellaneous 杂项
\RequirePackage[normalem]{ulem}
\RequirePackage{graphicx}
\RequirePackage[svgnames, dvipsnames]{xcolor}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{bookmark}
\RequirePackage{tikz}
\RequirePackage{float}
\setlength\abovedisplayskip{4pt plus 1pt}
\setlength\belowdisplayskip{4pt plus 1pt}