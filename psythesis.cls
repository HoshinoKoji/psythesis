\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{psythesis}[Document class for BNU thesis in psychology.]
\LoadClass[12pt, a4paper, fontset=none]{ctexart}

% Geometry 页面设置
\RequirePackage{geometry}
\geometry{
	paper = a4paper,
	top = 2.5cm,
	bottom = 2.0cm,
	left = 2.5cm,
	right = 2.0cm,
	% headheight = 15pt,
	% footskip = 1.5cm,
	% headsep = 1.2cm,
}

% Spacing 间距
\linespread{1.39}
\setlength{\baselineskip}{20pt}

% Text fonts 正文字体设置
\setmainfont{Times New Roman}
\setsansfont{Open Sans}
\setmonofont{Source Code Pro}
\input{fontset.tex}

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
\setmathfont{Latin Modern Math}
\setmathfont[range=\mathbb]{texgyretermes-math.otf}
\setCJKmathfont{方正标雅宋_GBK}

% Section formats 章节格式
\renewcommand*{\contentsname}{\hfill 目\hspace*{1\ccwd}录 \hfill}
\ctexset{
    section = {
        number = {\arabic{section}},
        format = {\zihao{3}\bfseries},
        nameformat = {},
        aftername = {\hspace*{1em}},
        titleformat = {\sffamily},
        beforeskip = 0.5em,
        afterskip = 0.5em,
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
\newcommand{\zhabstract}[2]{
    \pagestyle{empty}
    \begin{center}
        {\sffamily\bfseries\zihao{3}\@title}
        
        \vspace*{15pt}

        {\sffamily\zihao{-3}摘\hspace*{1\ccwd}要}

    \end{center}
    
    #1
    
    \vspace*{14pt}

    \textsf{关键词：}#2
    \clearpage
    \pagestyle{general}
}
\newcommand{\enabstract}[3]{
    \pagestyle{empty}
    \begin{center}
        {\rmfamily\zihao{3}#1}
        
        \vspace*{15pt}

        {\rmfamily\bfseries\zihao{-3}ABSTRACT}

    \end{center}
    
    #2
    
    \vspace*{14pt}

    \textbf{KEY WORDS: }#3
    \clearpage
    \pagestyle{general}
}

% Miscellaneous 杂项
\RequirePackage{ulem}
\RequirePackage{graphicx}
\RequirePackage[svgnames, dvipsnames]{xcolor}
\RequirePackage[colorlinks, linkcolor=black]{hyperref}