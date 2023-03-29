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
\setlength{\parskip}{0pt}

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
    math-style = ISO,
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
        afterskip = 0.5em,
        break = {\clearpage},
    },
    subsection = {
        number = {\arabic{section}.\arabic{subsection}},
        format = {\zihao{-3}\bfseries},
        nameformat = {},
        aftername = {\hspace*{0.5em}},
        titleformat = {\sffamily},
        beforeskip = 0.5em,
        afterskip = 0.5em,
    },
    subsubsection = {
        number = {\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
        format = {\zihao{4}\bfseries},
        nameformat = {},
        aftername = {\hspace*{0.5em}},
        titleformat = {\sffamily},
        beforeskip = 0.5em,
        afterskip = 0.5em,
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
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \begin{center}            
        {\zihao{3}\sffamily\bfseries\@title}\vspace*{2em}
        
        {\zihao{4}\@author}\vspace*{0.5em}
        
        {\zihao{-4}日期：\@date}
    \end{center}
    \clearpage
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
\newcommand{\zhabstract}[3][empty]{
    \pagestyle{#1}
    \noindent\begin{minipage}{\textwidth}
        \centering
        {\sffamily\bfseries\zihao{3}\@title}
    \end{minipage}
        
    \vspace*{20pt}
    
    {\noindent\sffamily\bfseries\zihao{-3}\hfill{摘\hspace*{0.8em}要}\hfill}
    
    \vspace*{20pt}

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
        {\rmfamily\bfseries\fontsize{16pt}{\baselineskip}\selectfont #2}
    \end{minipage}
        
    \vspace*{20pt}
    
    {\noindent\rmfamily\bfseries\fontsize{15pt}{\baselineskip}\selectfont\hfill ABSTRACT \hfill}
    
    \vspace*{20pt}
    
    {\rmfamily\upshape\fontsize{14pt}{\baselineskip}\selectfont%
     \setlength{\baselineskip}{20pt}#3\par}
    
    \vspace*{20pt}

    {\zihao{4}\textbf{KEY WORDS: }#4}
    
    \psythesis@oddnewpage
    \pagestyle{general}
}

% Table of contents 目录
\RequirePackage[titles]{tocloft}
\renewcommand*{\contentsname}{\vspace*{-\baselineskip}}
\renewcommand\cftdot{$\cdot$}
\renewcommand\cftsecdotsep{\cftdotsep}
\renewcommand\cftsecleader{\cftdotfill{\cftsecdotsep}}
\setlength{\cftbeforesecskip}{0em}
\newcommand{\PSYtableofcontents}{
    \pagestyle{empty}
    \vspace*{20pt}

    {\noindent\hfill \zihao{3}\bfseries\sffamily 目\hspace*{0.8em}录 \hfill}
    \tableofcontents

    \clearpage
    \setcounter{page}{1}
    \pagestyle{general}
}

% References 参考文献
\RequirePackage{csquotes, url}
\RequirePackage[style=apa, backend=biber]{biblatex}
% \AtBeginDocument{\ctexset{bibname = {~}}}
\setlength{\bibhang}{2em}
\AtBeginBibliography{
    \fontsize{10.5pt}{\baselineskip}\selectfont
    \setlength{\baselineskip}{16pt}
}
\newcommand{\zhreferences}{
    \psythesis@oddnewpage
    {\noindent\sffamily\bfseries\zihao{3}\setlength{\baselineskip}{20pt}\hfill{参考文献}\hfill}
    
    \nocite{*}\printbibliography[heading=none]
}

% Listings 列表
\RequirePackage{enumerate, enumitem, listings}
\setenumerate[1]{labelsep=0.65em, leftmargin=3.65em, itemsep=2.2pt, topsep=2.5pt}
\setitemize[1]{labelsep=0.65em, leftmargin=3.65em, itemsep=2.2pt, topsep=2.5pt}

% 图片与表格
\RequirePackage{caption}
\DeclareCaptionFormat{psythesis}{\fontsize{10.5pt}{20pt}\selectfont\textbf{#1#2}#3}
\captionsetup{labelsep=quad, format=psythesis}
\setlength{\belowcaptionskip}{-10.5pt}

% Miscellaneous 杂项
\RequirePackage[normalem]{ulem}
\RequirePackage{graphicx}
\RequirePackage[svgnames, dvipsnames]{xcolor}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{tikz}
\RequirePackage{float}