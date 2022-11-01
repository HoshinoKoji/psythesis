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
\setCJKmainfont{方正细雅宋_GBK}[
  	BoldFont = 方正粗雅宋_GBK,
    ItalicFont = 方正纤雅宋_GBK,
]
\setCJKsansfont{方正黑体_GBK}[
    BoldFont = 思源黑体 Bold,
]
\setCJKmonofont{思源等宽}[
  	ItalicFont = 思源等宽 EL,
  	BoldItalicFont = 思源等宽 L,
]

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

% Miscellaneous 杂项
\RequirePackage{graphicx}
\RequirePackage[svgnames, dvipsnames]{xcolor}
\RequirePackage[colorlinks, linkcolor=black]{hyperref}