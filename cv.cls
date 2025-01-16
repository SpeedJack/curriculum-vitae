\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2024/12/12 CV class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\PassOptionsToClass{a4paper}{article}
\PassOptionsToClass{10pt}{article}
\PassOptionsToClass{oneside}{article}
\PassOptionsToClass{notitlepage}{article}

\LoadClass{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[table]{xcolor}
\RequirePackage[a-3b,mathxmp]{pdfx}
\RequirePackage[default]{raleway}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}
\RequirePackage[autostyle=true]{csquotes}
\RequirePackage{microtype}
\RequirePackage[
	a4paper,
	margin=1cm,
]{geometry}
\RequirePackage{fontawesome5}
\RequirePackage{hyperref}
\hypersetup{hidelinks,pdfstartview=}
\RequirePackage{paracol}
\RequirePackage{ifthen}
\RequirePackage{xparse}
\RequirePackage{xstring}
\RequirePackage{suffix}
\RequirePackage{calc}
\RequirePackage{tikz}
\RequirePackage{tikz-3dplot}
\RequirePackage{smartdiagram}
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{ragged2e}
\RequirePackage{lipsum}

\usetikzlibrary{decorations.text}
\usetikzlibrary{fadings}
\usetikzlibrary{calc}
\usetikzlibrary{shapes.misc,positioning}
\usetikzlibrary{arrows}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{backgrounds}
\usetikzlibrary{calendar}
\usetikzlibrary{er}
\usetikzlibrary{patterns}
\usetikzlibrary{shapes}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{shapes.misc}
\usetikzlibrary{decorations}
\usetikzlibrary{topaths}

\graphicspath{{./img/}}

\setlength{\parindent}{0pt}
\setlength{\emergencystretch}{2pt}

\titleformat{\section}{\scshape\Large\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{12pt}{5pt}

\newcommand{\iconsize}{\huge}

\newcommand{\cvkeyword}[3]{%
	\colorbox{#2}{\textcolor{#3}{#1}} \phantom{}%
}

\newcommand{\iconcross}[7]{%
	\begin{tikzpicture}%
		\draw[ultra thick,draw=#2] (-2,-2) -- (2,2);%
		\draw[ultra thick,draw=#2] (-2,2) -- (2,-2);%
		\node[above=0.5em,text=#3] at (0,1) {#1 #4};%
		\node[below=0.5em,text=#3] at (0,-1) {#1 #5};%
		\node[right=0.5em,text=#3] at (1,0) {#1 #6};%
		\node[left=0.5em,text=#3] at (-1,0) {#1 #7};%
	\end{tikzpicture}%
}

\definecolor{headercolour}{rgb}{0.25,0.25,0.25}

\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}

\definecolor{pblue}{HTML}{0395DE}

\definecolor{headerblue}{HTML}{2EB6E1}
\definecolor{cvorange}{HTML}{FFC300}
\definecolor{cvpurple}{HTML}{B32EE1}

\definecolor{cvred}{HTML}{E1592E}
\colorlet{cvgreen}{materialgreen}
\colorlet{accentcolor}{headerblue}
\colorlet{cvpurple}{cvred}

\definecolor{timelinecolour}{HTML}{414B96}
\definecolor{jackbeige}{RGB}{226,212,186}

\definecolor{bgtitlebox}{HTML}{404040}

\newcommand{\paracolbackgroundoptions}{%
	\backgroundcolor{c[0](10000pt,1.5em)(0.5\columnsep,10000pt)}[rgb]{0.9,0.9,0.9}%
	\backgroundcolor{c[1](0.5\columnsep,4pt)(4pt,4pt)}[rgb]{1,1,1}%
	\backgroundcolor{C[0](10000pt,10000pt)(0.5\columnsep,10000pt)}[rgb]{0.9,0.9,0.9}%
	\backgroundcolor{C[1](0.5\columnsep,10000pt)(10000pt,10000pt)}[rgb]{1,1,1}%
}

\newcommand{\setasidefontcolour}{%
	\color{black}%
}

\definecolor{labelcolour}{HTML}{000000}
\definecolor{iconcolour}{HTML}{000000}
\definecolor{headerfontbox}{HTML}{000000}
\definecolor{headerfontboxfont}{HTML}{FFFFFF}
\definecolor{skilllabelcolour}{HTML}{b3b3b3}

\def\cvtag{\@ifstar\@@cvtag\@cvtag}
\def\@cvtag#1{%
	\tikz[baseline]%
	\node[anchor=base,draw=black!50,rounded corners,inner xsep=0.95ex,inner ysep=0.4ex,text height=1ex,text depth=.25ex]{\scriptsize\color{black!50}#1};%
}
\def\@@cvtag#1{%
	\tikz[baseline]%
	\node[anchor=base,draw=accentcolor,rounded corners,inner xsep=0.95ex,inner ysep=0.4ex,text height=1ex,text depth=.25ex]{\scriptsize\color{accentcolor!80!black}\textbf{#1}};%
}

\def\skill{\@ifstar\@@skill\@skill}
\def\@skill#1{%
	\tikz[baseline]%
	\node[anchor=base,draw=accentcolor,rounded corners,inner xsep=0.95ex,inner ysep=0.4ex,text height=1ex,text depth=.25ex]{\scriptsize\color{accentcolor}#1};%
}
\def\@@skill#1{%
	\tikz[baseline]%
	\node[anchor=base,draw=accentcolor,rounded corners,thick,inner xsep=0.95ex,inner ysep=0.4ex,text height=1ex,text depth=.25ex]{\scriptsize\color{accentcolor}\textbf{#1}};%
}

\smartdiagramset{
	bubble center node font = \footnotesize,
	bubble node font = \footnotesize,
	bubble center node size = 0.5cm,
	bubble node size = 0.5cm,
	distance center/other bubbles = 0.3cm,
	distance text center bubble = 0.5cm,
	bubble center node color = pblue,
	set color list = {materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
	bubble fill opacity = 0.6,
	bubble text opacity = 1,
	description title text width=0.5cm,
	description title width=0.5cm,
	description width=5cm,
	description text width=5cm,
	descriptive items y sep =1.25,
	back arrow distance = 0,
	back arrow disabled = true,
	border color = white,
}

\newcommand{\roundpic}[1]{%
	\begin{figure}[H]%
		\tikz%
		\draw[path picture={\node at (path picture bounding box.center) {\includegraphics[height=3.5cm]{#1}};}] (0,2) circle (1.7);%
	\end{figure}%
}

\newcommand{\squarepic}[1]{%
	\begin{figure}[H]%
		\tikz%
		\draw[path picture={\node at (path picture bounding box.center) {\includegraphics[height=4cm]{#1}};}] (0,0) - - (-2,2) - - (0,4) - - (2,2) - - cycle ;%
	\end{figure}%
}

\newcommand{\icon}[3]{%
	\phantom{x}{#3\color{#2}#1}\phantom{x}%
}

\newcommand{\pictofraction}[6]{%
	\pgfmathparse{#3 - 1}\foreach \n in {0,...,\pgfmathresult}{\icon{#1}{#2}{#6}}%
	\pgfmathparse{#5 - 1}\foreach \n in {0,...,\pgfmathresult}{\icon{#1}{#4}{#6}}%
}

\newcommand{\bg}[3]{%
	\colorbox{#1}{\bfseries\color{#2}#3}%
}

\newcommand{\bgupper}[3]{%
	\colorbox{#1}{\color{#2}\huge\bfseries\MakeUppercase{#3}}%
}

\newcommand{\bubblediagram}[1]{%
	\smartdiagram[bubble diagram]{#1}%
}

\newcommand{\skillbubble}[2]{%
	\begin{tikzpicture}%
		\draw[draw=none,fill=#1] (0,0) circle (0.#2);%
	\end{tikzpicture}%
}

\newcommand{\hobbyicon}[5]{%
	\begin{tikzpicture}%
		\draw[draw=none,fill=#3] (0,0) circle (0.5);%
		\node (icon) at (0,0) {#4#1};%
		\node[below=#5,align=center] at (icon) {#2};%
	\end{tikzpicture}%
}

\newcommand{\dashrule}[2]{%
	\begin{figure}[H]%
		\begin{minipage}[t]{#1\textwidth}%
			\tikz%
			\draw[loosely dashed,#2] (0,0) -- (\textwidth,0);%
		\end{minipage}%
	\end{figure}%
}

\newcommand{\dotrule}[2]{%
	\begin{figure}[H]%
		\begin{minipage}[t]{#1\textwidth}%
			\tikz%
			\draw[loosely dotted,ultra thick,#2] (0,0) -- (\textwidth,0);%
		\end{minipage}%
	\end{figure}%
}

\newcommand{\event}[5]{%
	{%
		\draw[draw=black,line width=0.2em,anchor=west] (0,#1) -- (#5,#1);%
		\node[fill=#2,right,inner sep=0.5em] at (#5,#1) {\textbf{#3}~~#4};%
	}%
}

\newcommand{\barrule}[3]{%
	\hspace{0.5em}%
	{%
		\color{#3}%
		\rule[\baselineskip]{#1\textwidth}{#2}%
	}%
	\vspace{0.5em}%
}

\newcommand{\cvevent}[6]{%
	{#1} & \textbf{#2}\newline\textsc{#3} \(\cdot\) {#4 ~\faMapMarker}\newline{\color{black!70}\footnotesize #5}\vspace{1.5em} & \raisebox{-0.7\height}{\includegraphics[height=1cm]{#6}}%
}

\newcommand{\cvdegree}[6]{%
	{#1} & \textbf{#2}\newline\textsc{#3} \(\cdot\) {#4 {\phantom{i}\footnotesize ~\faUniversity}}\newline{\color{black!70}\scriptsize #5}\vspace{0.5em} & \raisebox{-0.7\height}{\includegraphics[height=0.5cm]{#6}}%
}

\newcommand{\simpleheader}[5]{%
	\tikz[remember picture,overlay]{%
		\node[rectangle,fill=#1,anchor=north,minimum width=1.1\paperwidth,minimum height=3.09cm] (header) at ($(current page.north)+(0,0.01)$){};%
		\node[draw=none,align=left] (name) at (header) {%
			{\Huge\color{#5}#2 \textbf{#3}}%
		};%
		\node[draw=none,below] (description) at (name.south) {%
			\color{white}#4%
		};%
	}%
	\vspace{-0.7cm}%
}

\newcommand{\simpletitle}[4]{%
	\tikz[remember picture,overlay]{%
		\node[rectangle,fill=#1,anchor=north,minimum width=1.1\paperwidth,minimum height=3cm] (header) at ($(current page.north)+(0,0.01)$){};%
		\node[draw=none,align=left] (name) at (header) {%
			{\Huge\color{#3}#2}%
		};%
	}%
	\vspace{-0.7cm}%
}

\newcommand{\infobubble}[4]{%
	\scalebox{1.3}{%
		\begin{tikzpicture}%
			\draw[draw=#2,fill=#2] (0,0) circle (0.2cm);%
			\node at (0,0) {\color{#3}#1};%
			\node[right=0.2cm] at (0,0) {\texttt{#4}};%
		\end{tikzpicture}%
	}%
}

\newcolumntype{K}{!{\color{white}\ }c}

\newcommand{\privatetag}{%
	\begin{tikzpicture}[baseline=(O.base)]%
		\scriptsize%
		\draw[draw=cvred] (0,0) circle (0.2cm);%
		\node (O) at (0,0) {\color{cvred}\faLock};%
		\draw[draw=cvred] (0,0.2cm) -- (1.9cm,0.2cm) arc (90:-90:0.2cm) -- (0,-0.2cm);%
		\node[right=0.2cm] at (0,0.1cm) {\tiny\scshape\color{cvred} Private Repository};%
		\node[right=0.25cm] at (0,-0.1cm) {\tiny\slshape\color{black!70}Access on Request};%
	\end{tikzpicture}%
}

\newcommand{\partialprivatetag}{%
	\begin{tikzpicture}[baseline=(O.base)]%
		\scriptsize%
		\draw[draw=cvorange] (0,0) circle (0.2cm);%
		\node (O) at (0,0) {\color{cvorange}\faUnlock};%
		\draw[draw=cvorange] (0,0.2cm) -- (2.1cm,0.2cm) arc (90:-90:0.2cm) -- (0,-0.2cm);%
		\node[right=0.2cm] at (0,0.1cm) {\tiny\scshape\color{cvorange} Partial Private Code};%
		\node[right=0.35cm] at (0,-0.1cm) {\tiny\slshape\color{black!70}Access on Request};%
	\end{tikzpicture}%
}

\newcommand{\opensourcetag}{%
	\begin{tikzpicture}[baseline=(O.base)]%
		\scriptsize%
		\draw[draw=cvgreen] (0,0) circle (0.2cm);%
		\node (O) at (0,0) {\color{cvgreen}\faEye};%
		\draw[draw=cvgreen] (0,0.2cm) -- (1.8cm,0.2cm) arc (90:-90:0.2cm) -- (0,-0.2cm);%
		\node[right=0.2cm] at (0,0.01cm) {\scshape\color{cvgreen} Open Source};%
	\end{tikzpicture}%
	\vspace{0.12cm}%
}

\newcommand{\losttag}{%
	\begin{tikzpicture}[baseline=(O.base)]%
		\scriptsize%
		\draw[draw=black!70] (0,0) circle (0.2cm);%
		\node (O) at (0,0) {\color{black!70}\faBan};%
		\draw[draw=black!70] (0,0.2cm) -- (2.4cm,0.2cm) arc (90:-90:0.2cm) -- (0,-0.2cm);%
		\node[right=0.2cm] at (0,0.01cm) {\scshape\color{black!70} Unavailable/Lost};%
	\end{tikzpicture}%
	\vspace{0.12cm}%
}

\newcommand{\privaterepo}[1]{%
	\faGithub~\href{https://github.com/#1}{\texttt{#1}}~~~~\privatetag%
}

\newcommand{\partialprivaterepo}[1]{%
	\faGithub~\href{https://github.com/#1}{\texttt{#1}}~~~~\partialprivatetag%
}

\newcommand{\publicrepo}[1]{%
	\faGithub~\href{https://github.com/#1}{\texttt{#1}}\quad\opensourcetag%
}

\pgfkeyssetvalue{firstName}{Name}
\pgfkeyssetvalue{lastName}{Surname}
\pgfkeyssetvalue{address}{City}
\pgfkeyssetvalue{fullAddress}{Street 1, 12345 City}
\pgfkeyssetvalue{email}{name@example.com}
\pgfkeyssetvalue{emailDisplay}{name{\scriptsize\faAt}example.com}
\pgfkeyssetvalue{phoneDisplay}{+39\,111\,222\,3344}
\pgfkeyssetvalue{phone}{+391112223344}
\pgfkeyssetvalue{companyName}{Company Name Inc.}
\pgfkeyssetvalue{contactName}{Contact HR Person}
\pgfkeyssetvalue{companyAddress}{Company Street 1\\12345 City}
\pgfkeyssetvalue{position}{Application Position}
\pgfkeyssetvalue{positionDetails}{Position on example.com, job ID 12345}
\pgfkeyssetvalue{shortAbout}{Short about me}
\pgfkeyssetvalue{telegram}{TGUsername}
\pgfkeyssetvalue{github}{GHUsername}
\pgfkeyssetvalue{linkedin}{LIUsername}
\pgfkeyssetvalue{linkedinDisplay}{Name Surname}
\pgfkeyssetvalue{stackUrl}{https://stackexchange.com/users/12345}
\pgfkeyssetvalue{stackDisplay}{SEUsername}
\pgfkeyssetvalue{facebook}{FBUsername}
\pgfkeyssetvalue{facebookDisplay}{Name Surname}
\pgfkeyssetvalue{machine}{Laptop, OS}
\pgfkeyssetvalue{mobile}{Smartphone}
\pgfkeyssetvalue{editor}{Editor}

\NewDocumentCommand{\firstname}{m}{\pgfkeyssetvalue{firstName}{#1}}
\NewDocumentCommand{\lastname}{m}{\pgfkeyssetvalue{lastName}{#1}}
\NewDocumentCommand{\address}{m}{\pgfkeyssetvalue{address}{#1}}
\NewDocumentCommand{\fulladdress}{m}{\pgfkeyssetvalue{fullAddress}{#1}}
\NewDocumentCommand{\phone}{m}{\pgfkeyssetvalue{phone}{#1}}
\NewDocumentCommand{\email}{m}{\pgfkeyssetvalue{email}{#1}}
\NewDocumentCommand{\emaildisplay}{m}{\pgfkeyssetvalue{emailDisplay}{#1}}
\NewDocumentCommand{\phonedisplay}{m}{\pgfkeyssetvalue{phoneDisplay}{#1}}
\NewDocumentCommand{\companyname}{m}{\pgfkeyssetvalue{companyName}{#1}}
\NewDocumentCommand{\contactname}{m}{\pgfkeyssetvalue{contactName}{#1}}
\NewDocumentCommand{\companyaddress}{m}{\pgfkeyssetvalue{companyAddress}{#1}}
\NewDocumentCommand{\position}{m}{\pgfkeyssetvalue{position}{#1}}
\NewDocumentCommand{\positiondetails}{m}{\pgfkeyssetvalue{positionDetails}{#1}}
\NewDocumentCommand{\shortabout}{m}{\pgfkeyssetvalue{shortAbout}{#1}}
\NewDocumentCommand{\telegram}{m}{\pgfkeyssetvalue{telegram}{#1}}
\NewDocumentCommand{\github}{m}{\pgfkeyssetvalue{github}{#1}}
\NewDocumentCommand{\linkedin}{m}{\pgfkeyssetvalue{linkedin}{#1}}
\NewDocumentCommand{\linkedindisplay}{m}{\pgfkeyssetvalue{linkedinDisplay}{#1}}
\NewDocumentCommand{\stackurl}{m}{\pgfkeyssetvalue{stackUrl}{#1}}
\NewDocumentCommand{\stackdisplay}{m}{\pgfkeyssetvalue{stackDisplay}{#1}}
\NewDocumentCommand{\facebook}{m}{\pgfkeyssetvalue{facebook}{#1}}
\NewDocumentCommand{\facebookdisplay}{m}{\pgfkeyssetvalue{facebookDisplay}{#1}}
\NewDocumentCommand{\machine}{m}{\pgfkeyssetvalue{machine}{#1}}
\NewDocumentCommand{\mobile}{m}{\pgfkeyssetvalue{mobile}{#1}}
\NewDocumentCommand{\editor}{m}{\pgfkeyssetvalue{editor}{#1}}

\NewDocumentEnvironment{coverletter}{}{%
	\newgeometry{textwidth=0.75\paperwidth,textheight=\paperheight,noheadfoot}%
	\begin{tikzpicture}[remember picture,overlay,every node/.style={inner sep=0pt,outer sep=0pt}]%
		\begin{scope}[on background layer]%
			\fill[black!10] (current page.north west) rectangle ++(\paperwidth, -3.2cm);%
			\coordinate (nameBlockPos) at ($(current page.north west)+(0pt, -3.85cm)$);%
			\fill[bgtitlebox,drop shadow] (nameBlockPos) rectangle ++(0.5\paperwidth-2.5cm,1.3cm)%
				node[anchor=west,xshift=-5cm,yshift=-0.65cm] (coverletter name) {\LARGE\selectfont\color{white}\pgfkeysvalueof{firstName} \textbf{\pgfkeysvalueof{lastName}}};%
			\fill[black!10] (current page.south east) rectangle ++(-\paperwidth, 3.2cm);%
			\coordinate (addressBlockPos) at ($(current page.south west)+(0pt, 2.2cm)$);%
			\fill[bgtitlebox,drop shadow] (addressBlockPos) rectangle ++(0.5\paperwidth-2.5cm,2cm)%
				node[anchor=west,text=white,xshift=-5cm,yshift=-1cm] (email) {\large\href{mailto:\pgfkeysvalueof{email}}{\color{white}{\pgfkeysvalueof{email}}}};%
			\node[align=right,text=white,below=-1ex of email.north west,anchor=south west] (address) {\small\pgfkeysvalueof{address}};%
			\node[align=right,text=white,below=1ex of email.south west,anchor=north west] (phone) {\large\href{tel:\pgfkeysvalueof{phone}}{\color{white}{\pgfkeysvalueof{phoneDisplay}}}};%
		\end{scope}%
	\end{tikzpicture}%
	\vfill\par\color{black!90}%
	\textbf{\pgfkeysvalueof{companyName}}\\%
	\IfEq{\pgfkeysvalueof{contactName}}{}{}{\pgfkeysvalueof{contactName}\\}%
	\IfEq{\pgfkeysvalueof{companyAddress}}{}{}{\par\pgfkeysvalueof{companyAddress}\\}%
	\vspace{1ex}\par%
	\textbf{Application as \pgfkeysvalueof{position}}\hfill\@date\\%
	\IfEq{\pgfkeysvalueof{positionDetails}}{}{}{\pgfkeysvalueof{positionDetails}\\}%
	\vspace{2ex}\par%
}{
	\par\vfill%
	\restoregeometry%
	\clearpage%
}

\NewDocumentCommand{\printsignature}{}{%
	\par\medskip\includegraphics[height=1cm]{signature}%
}

\pagestyle{empty}

% vim: tw=10000
