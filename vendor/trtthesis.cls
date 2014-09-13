%%
%% This is file `trtthesis.cls',
%% This contains add-ons for tutthesis.cls file by Sami Paavilainen.
%% Author: Samuli Hirvonen (March 2014)
%% --------------------------------------------------------------
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%
%% This is a Derived Work from the Work tutthesis.cls that is available at
%%    http://www.tut.fi/pop/opiskelu/opinnaytetyot/latex/tutthesis.cls
%% and is also included in this repository.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{vendor/trtthesis}
        [2006/10/16 v0.1f Extension to LaTeX report document class]
\LoadClassWithOptions{report}

% ------------
% Typography
%
% Headings : Helvetica
% ------------
\RequirePackage{helvet}

% -----------------
% Required packages
% -----------------
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}% skandinaaviset kirjasimet
\RequirePackage{graphicx}% grafiikkapaketti
\RequirePackage{subfigure}% mahdollistaa pikkukuvat..
\RequirePackage{fancyhdr}% tyylikkäämmät sivutukset...
\RequirePackage{supertabular}% ylisivun mittaiset taulukot..
\RequirePackage{amsmath}% matematiikkakirjasto
\RequirePackage{setspace}% rivivälin vaihtoon
\RequirePackage{mdwlist} % Listojen rivinvälin määrittämiseen
\RequirePackage{parskip}
\RequirePackage{csquotes}
\RequirePackage{hyphenat} % Tavutus ja tavutuksen poisto tarvittaessa
\RequirePackage{titlesec} % Otsikkotyylit
\RequirePackage{etoolbox} % Patch commands with \patchcmd
\RequirePackage[nodayofweek]{datetime}
\RequirePackage{refcount,lastpage}
\RequirePackage[backend=biber,style=authoryear,maxbibnames=99,maxcitenames=2,
        firstinits=true,uniquename=init]{biblatex}

% ---------------------
% Document measurements
% ---------------------
\RequirePackage[paper=a4paper,inner=4cm,outer=2cm,top=2.5cm,bottom=2.5cm,headsep=1em]{geometry}

% -----------
% Line height
% -----------
\RequirePackage{setspace}
\setstretch{1.2}

% ----------------------
% Precontent environment
% ----------------------
\newenvironment{precontent}{
  \pagenumbering{roman}}{}

% -------------------
% Content environment
% -------------------
\newenvironment{content}{
  \renewcommand{\chaptermark}[1]{\markboth{\thechapter \ ##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{}{}}
  \lhead{\fancyplain{}{\leftmark}}
  \pagenumbering{arabic}
}{}


% -------
% Headers
% -------
\pagestyle{fancyplain}

\rhead{\thepage}
\chead{}
\lhead{}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt} % Poistaa vaakaviivan

% -----------
% Table of contents
% -----------

% Chapters that don't have numbering but are wanted to
% show up in Table of Contents are marked with \nnchapter
\newcommand{\nnchapter}[1]{
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{\MakeUppercase#1}
}

\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \nnchapter{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
}

\renewcommand\@dotsep{0}
%\newcommand*\l@appendix{\@dottedtocline{1}{0.0em}{3.8em}}
\renewcommand*\l@chapter{\@dottedtocline{1}{0.0em}{1.5em}} % kommentoituna hyvä
\renewcommand*\l@subsection{\@dottedtocline{2}{2.5em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{6.5em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{9.5em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{11.5em}{6em}}

\renewcommand*\l@chapter[2]{
    \addpenalty{-\@highpenalty}%
    \vskip 0.4em \@plus\p@
    \setlength\@tempdima{2.5em}%
    \begingroup
      \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \textbf{\textsf{\uppercase{#1}\nobreak\leaders\hbox{$\m@th
        	\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}
        \hfill\nobreak\hb@xt@\@pnumwidth{\hss #2}}}\par
      \penalty\@highpenalty
    \endgroup
    \vskip 0.4em \@plus\p@
}

\renewcommand*\l@section[2]{%
    \addpenalty{-\@highpenalty}%
    \vskip 0.1em \@plus\p@
    \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \hskip 2.5em
      \textsf{#1 \leaders\hbox{\rule{2pt}{0.5pt}}\hfill \hb@xt@\@pnumwidth{\hss #2}}\par
      \penalty\@highpenalty
    \endgroup
    \vskip 0.1em \@plus\p@
}

\renewcommand*\l@subsection[2]{%
    \addpenalty{-\@highpenalty}%
    \vskip 0.1em \@plus\p@
    \setlength\@tempdima{2.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \hskip 5em
      \textsf{#1 \leaders\hbox{\rule{2pt}{0.5pt}}\hfill \hb@xt@\@pnumwidth{\hss #2}}\par
      \penalty\@highpenalty
    \endgroup
    \vskip 0.1em \@plus\p@
}

% -------------
% Chapter title
% -------------
\titleformat{\chapter}
        {\Large\sffamily\bfseries}
        {\makebox[2em][l]{\thechapter.}}
        {0pt}
        {\uppercase}
\titlespacing{\chapter}{0pt}{32pt}{42pt}

% -------------
% Section title
% -------------
\titleformat{\section}
        {\large\sffamily\bfseries}
        {\makebox[2em][l]{\thesection}}
        {0pt}
        {}
\titlespacing{\section}{0pt}{18pt}{12pt}

% ----------------
% Subsection title
% ----------------
\titleformat{\subsection}
        {\large\sffamily\bfseries}
        {\makebox[3em][l]{\thesubsection}}
        {0pt}
        {}
\titlespacing{\subsection}{0pt}{18pt}{12pt}

\newcommand\chaptertocstyle{chapter}
\newcommand\chaptertocstr{\thechapter.}
\newcommand\tutchapter{\thechapter.}

% --------------------------
% Bibliography and Citations
% --------------------------

\defbibheading{bibliography}[\bibname]{%
        \addcontentsline{toc}{chapter}{\bibname}%
        \chapter*{\MakeUppercase{#1}}%
        \markboth{#1}{#1}}

% Määritellään puolipiste viitteiden erottimeksi [1; 2] pilkun sijaan [1, 2].

\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{;\penalty\@m\ }%
     \edef\@citeb{\expandafter\@firstofone\@citeb}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {\csname b@\@citeb\endcsname}}}{#1}}

% TUT specific:
\setlength\parindent{0cm}   % vaihda 0:ksi tarvittaessa
\setlength\brokenpenalty{1000}

\newlength\chapterspace
\setlength\chapterspace{0.4cm} % Tila otsikon numeron ja nimen välillä
\newcommand\chapterheadbefore{26pt}
\newcommand\chapterheadafter{42pt}
\newcommand\chapfigname{\thechapter}


% kuukausien nimet
\newcommand{\monthyear}{\ifnum\number\day<10 0\fi%
	\ifcase \month \or Tammikuu\or Helmikuu\or Maaliskuu\or Huhtikuu\or Toukokuu%
	\or Kesäkuu\or Heinäkuu\or Elokuu\or Syyskuu\or Lokakuu\or Marraskuu\or Joulukuu\fi, %
	\number \year}

\newcommand{\monthyearenglish}{\ifnum\number\day<10 0\fi%
  \ifcase \month \or January\or February\or March\or April\or May%
  \or June\or July\or August\or September\or October\or November\or December\fi, %
  \number \year}

\newenvironment*{termiluettelo}
{\begin{list}{}{
\setlength{\labelwidth}{7em}
\setlength{\itemindent}{0em}
\setlength{\leftmargin}{7em}
\setlength{\labelsep}{0em}
\renewcommand*{\makelabel}[1]
{\normalfont ##1\hfil}}}
{\end{list}}

% ------------
% Caption styles
%
% Captions are in the form _*{type} {number}.*_ {caption}
% ------------

\RequirePackage[labelsep=period]{caption}
\captionsetup[figure]{labelfont={it,bf},textfont=it}
\renewcommand{\thefigure}   {\arabic{figure}}
\renewcommand{\thetable}    {\arabic{table}}
\renewcommand{\thesubtable} {\arabic{subtable}}
\renewcommand{\thesubfigure}{\arabic{subfigure}}

% ------------
% Images
%
% The first parameter is width of the image, and defaults to
% 70% of page width.
% Usage example: \centeredpicture[1.0]{esimKuva}{Matlabilla tehty PDF-muotoinen esimerkkikuva.}
% ------------

\newcommand{\centeredpicture}[3][0.7]{
  \begin{figure}[h]
  \begin{center}
  \includegraphics[width=#1\textwidth]{#2}
  \end{center}
  \caption{#3}
  \label{fig:#2}
  \end{figure}
}

%%
%% End of file `trtthesis.cls'.
